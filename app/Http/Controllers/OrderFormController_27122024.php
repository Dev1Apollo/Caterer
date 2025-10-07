<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Http\Request;
use App\Models\ItemOrder;
use App\Models\ItemMaster;
use App\Models\ItemSubCategory;
use App\Models\OrderDetails;
use App\Models\OrderMaster;
use Illuminate\Support\Facades\DB;
use Barryvdh\DomPDF\Facade\Pdf;

class OrderFormController extends Controller
{
    public function index(Request $request, $id)
    {
        try {
            $OrderForm = OrderMaster::select(
                'orderformmaster.*',
                'orderformdetails.*',
                'itemmaster.iItemMasterId',
                'itemmaster.strItemMasterName',
                'itemsubcategory.iItemSubCategoryId',
                'itemsubcategory.strItemSubCategoryName',
            )
                ->orderBy('orderformmaster.iOrderFormMasterId', 'desc')
                ->join('orderformdetails', 'orderformdetails.iOrderFormMasterId', '=', 'orderformmaster.iOrderFormMasterId')
                ->join('itemmaster', 'itemmaster.iItemMasterId', '=', 'orderformdetails.iItemMasterId')
                ->join('itemsubcategory', 'itemsubcategory.iItemSubCategoryId', '=', 'orderformdetails.iItemSubCategoryId')
                ->where(['orderformmaster.iStatus' => 1, 'orderformmaster.isDelete' => 0, "iCustomerId" => $id])
                ->paginate(25);
            // dd($OrderForm);

            $ItemMasters = ItemMaster::where(['iStatus' => 1, 'isDelete' => 0])
                ->whereIn('iItemCategoryId', [2, 3])
                ->get();
            $ItemSubCategory = ItemSubCategory::where(['isDelete' => 0])
                ->whereIn('iItemCategoryId', [2, 3])
                ->get();
            // dd($ItemSubCategory);


            return view('orderform.index', compact('OrderForm', 'ItemMasters', 'ItemSubCategory', 'id'));
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function getitems(Request $request, $id)
    {
        $datas = ItemMaster::where(['iStatus' => 1, 'isDelete' => 0, "iItemSubCategoryId" => $id])->get();

        $html = '<option selected value="">Select Items</option>';
        foreach ($datas as $data) {
            $html .= '<option value="' . $data->iItemMasterId . '">' . $data->strItemMasterName . '</option>';
        }
        echo $html;
    }

    public function store(Request $request)
    {
        // dd($request);
        try {
            $request->validate([
                'iItemSubCategoryId' => 'required',
                'iItemMasterId' => 'required',
            ]);

            $ItemSubCategory = ItemSubCategory::where(['isDelete' => 0])
                ->where(['iItemSubCategoryId' => $request->iItemSubCategoryId])
                ->first();
            $Customer = Customer::where(['iStatus' => 1, 'isDelete' => 0, 'iCustomerId' => $request->iCustomerId])->first();

            $OrderMaster = OrderMaster::where(['isDelete' => 0])
                ->where(['iCustomerId' => $request->iCustomerId])
                ->first();
                // dd($OrderMaster);

            $Check = OrderDetails::where(['iStatus' => 1, 'isDelete' => 0, 'iItemSubCategoryId' => $request->iItemSubCategoryId,  "iItemMasterId" => $request->iItemMasterId])
               ->whereHas('orderMaster', function ($query) use ($request) {
                    $query->where('iCustomerId', $request->iCustomerId);
                })
                ->first();
            // dd($Check)    ;

            if ($Check) {
                return back()->with('opps', 'Data Already Exists!.');
            }

            if ($OrderMaster == null || $OrderMaster == "") {
                // dd('if');
                $Order = OrderMaster::create([
                    'iType' => $request->iType ?? 0,
                    'iCustomerId' => $request->iCustomerId ?? 0,
                    'strCustomerName' => $Customer->strCustomerName,
                    'iPhoneNo' => $Customer->iMobileNo,
                    'iPhoneNoHome' => $Customer->iMobileHouse,
                    'strDeliveryAddress' => $Customer->strAddress ?? 0,
                    'created_at' => now(),
                    'strIP' => $request->ip()
                ]);
                $OrderMaster = $Order->id; 
            }else{
                $OrderMaster =  $OrderMaster->iOrderFormMasterId;
            }
            // dd('Heello');
            
            $Data = OrderDetails::create([
                'iOrderFormMasterId' => $OrderMaster ?? 0,
                'iItemCategoryId' => $ItemSubCategory->iItemCategoryId ?? 0,
                'iItemSubCategoryId' => $request->iItemSubCategoryId ?? 0,
                'iItemMasterId' => $request->iItemMasterId ?? 0,
                'strCount' => $request->strCount,
                'strKG' => $request->strKG,
                'strGram' => $request->strGram,
                'iCustomerId' => $request->iCustomerId ?? 0,
                'created_at' => now(),
                'strIP' => $request->ip()
            ]);
            if ($Data) {
                return back()->with('success', 'Order Form Created Successfully.');
            } else {
                return back()->with('error', 'Invalid request.');
            }
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function editview(Request $request, $id)
    {
        try {
            // dd($id);
            $data = OrderDetails::where(['iStatus' => 1, 'isDelete' => 0, "iOrderFormMasterId" => $id])
                ->first();

            return json_encode($data);
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
                'iItemMasterId' => 'required'
            ]);

            $update = ItemOrder::where(['iStatus' => 1, 'isDelete' => 0, 'iItemOrderId' => $request->iItemOrderId])
                ->update([
                    'iItemMasterId' => $request->iItemMasterId ?? 0,
                    'strPreviousDays' => $request->strPreviousDays,
                    'strMoring' => $request->strMoring,
                    'strAfternoon' => $request->strAfternoon,
                    'strEvening' => $request->strEvening,
                    'updated_at' => date('Y-m-d H:i:s')
                ]);

            //return redirect()->route('product.index')->with('success', 'Customer Updated Successfully.');
            if ($update) {
                return back()->with('success', 'Item Order Updated Successfully.');
            } else {
                return back()->with('error', 'Invalid request.');
            }
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function delete(Request $request)
    {
        // dd($request);
        try {
            OrderMaster::where(['iStatus' => 1, 'isDelete' => 0, 'iOrderFormMasterId' => $request->iOrderFormMasterId])->delete();
            OrderDetails::where(['iStatus' => 1, 'isDelete' => 0, 'iOrderFormMasterId' => $request->iOrderFormMasterId])->delete();

            return back()->with('success', 'Order Form Deleted Successfully!.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function itemorderpdf($id)
    {
        try {
            $OrderMaster = OrderMaster::select(
                'orderformmaster.*',
                'orderformdetails.*',
                'itemmaster.iItemMasterId',
                'itemmaster.strItemMasterName',
                'itemsubcategory.iItemSubCategoryId',
                'itemsubcategory.strItemSubCategoryName',
            )
                ->orderBy('orderformmaster.iOrderFormMasterId', 'asc')
                ->join('orderformdetails', 'orderformdetails.iOrderFormMasterId', '=', 'orderformmaster.iOrderFormMasterId')
                ->join('itemmaster', 'itemmaster.iItemMasterId', '=', 'orderformdetails.iItemMasterId')
                ->join('itemsubcategory', 'itemsubcategory.iItemSubCategoryId', '=', 'orderformdetails.iItemSubCategoryId')
                ->where(['orderformmaster.iStatus' => 1, 'orderformmaster.isDelete' => 0, "iCustomerId" => $id])
                ->get();
            // dd($OrderMaster);

            $Customers = Customer::orderBy('iCustomerId', 'desc')
                ->where(['customer.iStatus' => 1, 'customer.isDelete' => 0])
                ->where("iCustomerId", "=", $id)
                ->first();

            $pdf = Pdf::loadView('pdf.OrderFormPdf', ['OrderMaster' => $OrderMaster, "Customers" => $Customers])->setPaper('a4', 'portrait');
            // dd($pdf);

            // exit;
            return $pdf->download($Customers->strCustomerName . '_' . date('d-m-Y', strtotime($Customers->strFunctionDate)) . '.pdf');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }
}
