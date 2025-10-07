<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ItemCategory;
use App\Models\ItemSubCategory;
use App\Models\ItemMaster;
use Illuminate\Support\Facades\DB;

class ItemMasterController extends Controller
{
    public function index(Request $request)
    {
        try {

            $ItemCategory = ItemCategory::orderBy('strItemCategoryName', 'asc')->get();
            $ItemSubCategory = ItemSubCategory::orderBy('strItemSubCategoryName', 'asc')->get();
            $ItemMasters = ItemMaster::select(
                'itemmaster.*',
                DB::raw('(select strItemCategoryName from itemcategory where itemcategory.iItemCategoryId=itemmaster.iItemCategoryId) as strItemCategoryName'),
                DB::raw('(select strItemSubCategoryName from itemsubcategory where itemsubcategory.iItemSubCategoryId=itemmaster.iItemSubCategoryId) as SubCategoryName')
            )
                ->orderBy('iItemMasterId', 'desc')
                ->where(['itemmaster.iStatus' => 1, 'itemmaster.isDelete' => 0])
                ->when($request->strItemMasterName, fn($query, $strItemMasterName) => $query
                    ->where('itemmaster.strItemMasterName', 'like', "%$strItemMasterName%"))
                ->when($request->iItemCategoryId, fn($query, $iItemCategoryId) => $query
                    ->where('itemmaster.iItemCategoryId', '=', $iItemCategoryId))
                ->when($request->iItemSubCategoryId, fn($query, $iItemSubCategoryId) => $query
                    ->where('itemmaster.iItemSubCategoryId', '=', $iItemSubCategoryId))
                ->paginate(env('PER_PAGE'));
            // dd($Product);
            $strItemMasterName = $request->strItemMasterName;
            $iItemCategoryId = $request->iItemCategoryId;
            $iItemSubCategoryId = $request->iItemSubCategoryId;
            return view('item_master.index', compact('ItemCategory', 'ItemSubCategory', 'strItemMasterName', 'ItemMasters', 'iItemCategoryId', 'iItemSubCategoryId'));
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function create()
    {
        try {
            $ItemCategory = ItemCategory::orderBy('strItemCategoryName', 'asc')->get();
            $ItemSubCategory = ItemSubCategory::orderBy('strItemSubCategoryName', 'asc')->get();
            return view('item_master.add', compact('ItemCategory', 'ItemSubCategory'));
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function getsubcategory(Request $request, $id)
    {

        $datas = ItemSubCategory::where(['iItemCategoryId' => $id])->get();
        $html = '<option selected value="">Select Sub Category Name</option>';
        foreach ($datas as $data) {
            $html .= '<option value="' . $data->iItemSubCategoryId . '">' . $data->strItemSubCategoryName . '</option>';
        }
        echo $html;
    }

    public function store(Request $request)
    {
        try {
            $request->validate([
                'iItemCategoryId' => 'required',
                'strSequenceNo' => 'required',
                'strItemMasterName' => 'required|unique:itemmaster,strItemMasterName'
            ], [
                'strItemMasterName.required' => 'The Item Master name field is required.',
                'strItemMasterName.unique' => 'The Item Master name must be unique.',
            ]);

            // $ProductLoverCase = Str::lower($request->productname);
            // $ProductName = str_replace(' ', '-', $ProductLoverCase);
            $Data = ItemMaster::create([
                'iItemCategoryId' => $request->iItemCategoryId,
                'iItemSubCategoryId' => $request->iItemSubCategoryId ?? 0,
                'iSequenceNo' => $request->strSequenceNo,
                // 'slugname' => $ProductName,
                'strItemMasterName' => $request->strItemMasterName,
                'strIP' => $request->ip()
            ]);

            return redirect()->route('itemmaster.index')->with('success', 'Item Master Created Successfully.');
            // return back()->with('success', 'Product Created Successfully.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function editview($id)
    {
        try {

            $ItemMaster = ItemMaster::where(['itemmaster.iStatus' => 1, 'itemmaster.isDelete' => 0, "iItemMasterId" => $id])
                ->first();
            return json_encode($ItemMaster);
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function update(Request $request)
    {
        try {
            $request->validate([
                'iItemCategoryId' => 'required',
                'strSequenceNo' => 'required',
                'strItemMasterName' => 'required|unique:itemmaster,strItemMasterName,' . $request->iItemMasterId . ',iItemMasterId'
            ], [
                'strItemMasterName.required' => 'The Item Master name field is required.',
                'strItemMasterName.unique' => 'The Item Master name must be unique.',
            ]);

            // $ProductLoverCase = Str::lower($request->productname);
            // $ProductName = str_replace(' ', '-', $ProductLoverCase);
            $update = ItemMaster::where(['iStatus' => 1, 'isDelete' => 0, 'iItemMasterId' => $request->iItemMasterId])
                ->update([
                    'iItemCategoryId' => $request->iItemCategoryId,
                    'iItemSubCategoryId' => $request->iItemSubCategoryId ?? 0,
                    'iSequenceNo' => $request->strSequenceNo,
                    'strItemMasterName' => $request->strItemMasterName,
                    'updated_at' => date('Y-m-d H:i:s')
                ]);
            
            return redirect()->route('itemmaster.index', ['page' => $request->page])
                ->with('success', 'Item Master Updated Successfully.');    
            
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function delete(Request $request)
    {
        try {
            ItemMaster::where(['iStatus' => 1, 'isDelete' => 0, 'iItemMasterId' => $request->iItemMasterId])->delete();
            
            return redirect()->route('itemmaster.index', ['page' => $request->page])
                ->with('success', 'Item Master Deleted Successfully.');    
            
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }
}
