<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Http\Request;
use App\Models\ItemOrder;
use App\Models\ItemMaster;
use Illuminate\Support\Facades\DB;
use Barryvdh\DomPDF\Facade\Pdf;

class ItemOrderController extends Controller
{
    public function index(Request $request, $id)
    {
        try {
            $ItemOrders = ItemOrder::select('itemorder.*', 'itemmaster.strItemMasterName')
                ->join('itemmaster', 'itemmaster.iItemMasterId', '=', 'itemorder.iItemMasterId')
                ->orderBy('iCustomerId', 'desc')
                ->where(['itemorder.iStatus' => 1, 'itemorder.isDelete' => 0, "iCustomerId" => $id])
                ->paginate(2);
            $ItemMasters = ItemMaster::where(['iStatus' => 1, 'isDelete' => 0, "iItemCategoryId" => 1])->get();

            return view('itemorder.index', compact('ItemOrders', 'ItemMasters', 'id'));
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function store(Request $request)
    {
        // dd($request);
        try {
            $request->validate([
                'iItemMasterId' => 'required',
                'iCustomerId' => 'required',
            ]);
            $Data = ItemOrder::create([
                'iItemMasterId' => $request->iItemMasterId ?? 0,
                'strPreviousDays' => $request->strPreviousDays,
                'strMoring' => $request->strMoring,
                'strAfternoon' => $request->strAfternoon,
                'strEvening' => $request->strEvening,
                'iCustomerId' => $request->iCustomerId ?? 0,
                'created_at' => now(),
                'strIP' => $request->ip()
            ]);
            if ($Data) {
                //return redirect()->route('product.index')->with('success', 'Product Created Successfully.');
                return back()->with('success', 'Item Order Created Successfully.');
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
            $data = ItemOrder::orderBy('iItemOrderId', 'desc')
                ->where(['itemorder.iStatus' => 1, 'itemorder.isDelete' => 0, "iItemOrderId" => $id])
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
                return redirect()->route('itemorder.index', [$request->iCustomerId])
                ->with('success', 'Item Order Updated Successfully.')
                ->with(['page' => $request->page]);
                // return back()->with('success', 'Item Order Updated Successfully.');
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

        try {
            ItemOrder::where(['iStatus' => 1, 'isDelete' => 0, 'iItemOrderId' => $request->iItemOrderId])->delete();
                
            return redirect()->route('itemorder.index', [$request->iCustomerId])
                 ->with('success', 'Item Order Deleted Successfully.')
                 ->withQueryString(['page' => $request->page]);
 
            // return back()->with('success', 'Item Order Deleted Successfully!.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function itemorderpdf($id)
    {
        try {
            $ItemOrder = ItemOrder::select(
                'itemorder.*',
                'itemmaster.iItemMasterId',
                'itemmaster.strItemMasterName'
            )
                ->orderBy('iItemOrderId', 'asc')
                ->where(['itemorder.iStatus' => 1, 'itemorder.isDelete' => 0, 'itemorder.iCustomerId' => $id])
                ->join('itemmaster', 'itemmaster.iItemMasterId', '=', 'itemorder.iItemMasterId')
                ->get();
            // dd($ItemOrder);
            $Customers = Customer::orderBy('iCustomerId', 'desc')
                ->where(['customer.iStatus' => 1, 'customer.isDelete' => 0])
                ->where("iCustomerId", "=", $id)
                ->first();

            $pdf = Pdf::loadView('pdf.ItemOrderPdf', ['ItemOrder' => $ItemOrder, "Customers" => $Customers]);
            // dd($pdf);

            // exit;
            return $pdf->download($Customers->strCustomerName . '_' . date('d-m-Y', strtotime($Customers->strFunctionDate)) . '.pdf');
            //return view('functionmaster.index', compact('FunctionMasters', 'FunctionDetails', 'Customers'));
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }
}
