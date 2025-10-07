<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\FunctionMaster;
use App\Models\FunctionDetails;
use App\Models\Customer;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Barryvdh\DomPDF\Facade\Pdf;

class FunctionController extends Controller
{
    public function index($id)
    {
        try {
            $FunctionMasters = FunctionMaster::orderBy('iFunctionId', 'desc')
                ->where(['functionmaster.iStatus' => 1, 'functionmaster.isDelete' => 0, 'iCustomerId' => $id])
                ->paginate(25);
            $Customers = Customer::orderBy('iCustomerId', 'desc')
                ->where(['customer.iStatus' => 1, 'customer.isDelete' => 0])
                ->where("iCustomerId", "=", $id)
                ->first();
            return view('functionmaster.index', compact('FunctionMasters', 'id', 'Customers'));
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function createview(Request $request, $id)
    {
        try {
            // $Category = Category::orderBy('categoryname', 'asc')->get();
            // $SubCategory = SubCategory::orderBy('subcategoryname', 'asc')->get();
            return view('functionmaster.add', compact('id'));
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function store(Request $request)
    {
        try {
            $request->validate([
                'strFunction' => 'required',
                'strDate' => 'required',
                'iNoOfPerosn' => 'required',
                'iRatePerPerson' => 'required',
                'iTotalAmount' => 'required'
            ]);
            $strDate = date('Y-m-d', strtotime($request->strDate)) ?? "";
            $Data = FunctionMaster::create([
                'iCustomerId' => $request->iCustomerId ?? 0,
                'strFunction' => $request->strFunction ?? "",
                'strDate' => $strDate ?? 0,
                'iNoOfPerosn' => $request->iNoOfPerosn ?? 0,
                'iRatePerPerson' => $request->iRatePerPerson ?? 0,
                'iTotalAmount' => $request->iTotalAmount ?? "",
                'created_at' => date('Y-m-d H:i:s'),
                'strIP' => $request->ip()
            ]);
            foreach ($request->product as $product) {
                // $insertedId = $Data->id;
                $categoryId = "categoryId_" . $product;
                $iSubCategoryId = "iSubCategoryId_" . $product;
                FunctionDetails::create([
                    "iFunctionId" => $Data->id,
                    "iProductId" =>  $product,
                    "iCategoryId" => $request->$categoryId,
                    "iSubCategoryId" => $request->$iSubCategoryId,
                    'created_at' => date('Y-m-d H:i:s'),
                    'strIP' => $request->ip()
                ]);
            }
            // FunctionDetails
            if ($Data) {
                return redirect()->route('customerfunction.index', $request->iCustomerId)->with('success', 'Function Created Successfully.');
                //return back()->with('success', 'Customer Created Successfully.');
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
            $FunctionMaster = FunctionMaster::where(['iStatus' => 1, 'isDelete' => 0, 'iFunctionId' => $id])->first();
            $functionDetails = FunctionDetails::where(['iStatus' => 1, 'isDelete' => 0, 'iFunctionId' => $id])->get();
            $functionDetailArr = [];
            foreach ($functionDetails as $functionDetail) {
                $functionDetailArr[] = array(
                    "iProductId" => $functionDetail->iProductId
                );
            }

            return view('functionmaster.edit', compact('FunctionMaster', 'functionDetailArr'));
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
                'strFunction' => 'required',
                'strDate' => 'required',
                'iNoOfPerosn' => 'required',
                'iRatePerPerson' => 'required',
                'iTotalAmount' => 'required'
            ]);
            $strDate = date('Y-m-d', strtotime($request->strDate)) ?? "";
            $update = FunctionMaster::where(['iStatus' => 1, 'isDelete' => 0, 'iFunctionId' => $request->iFunctionId])
                ->update([
                    'iCustomerId' => $request->iCustomerId ?? 0,
                    'strFunction' => $request->strFunction ?? "",
                    'strDate' => $strDate ?? 0,
                    'iNoOfPerosn' => $request->iNoOfPerosn ?? 0,
                    'iRatePerPerson' => $request->iRatePerPerson ?? 0,
                    'iTotalAmount' => $request->iTotalAmount ?? "",
                    'created_at' => date('Y-m-d H:i:s'),
                    'strIP' => $request->ip()
                ]);
            FunctionDetails::where(["iFunctionId" => $request->iFunctionId])->delete();
            foreach ($request->product as $product) {
                // $insertedId = $Data->id;
                $categoryId = "categoryId_" . $product;
                $iSubCategoryId = "iSubCategoryId_" . $product;
                FunctionDetails::create([
                    "iFunctionId" => $request->iFunctionId,
                    "iProductId" =>  $product,
                    "iCategoryId" => $request->$categoryId,
                    "iSubCategoryId" => $request->$iSubCategoryId,
                    'created_at' => date('Y-m-d H:i:s'),
                    'strIP' => $request->ip()
                ]);
            }
            //return redirect()->route('product.index')->with('success', 'Customer Updated Successfully.');
            if ($update) {
                return redirect()->route('customerfunction.index', $request->iCustomerId)->with('success', 'Function Updated Successfully.');
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
            FunctionMaster::where(['iStatus' => 1, 'isDelete' => 0, 'iFunctionId' => $request->iFunctionId])->delete();
            FunctionDetails::where(['iStatus' => 1, 'isDelete' => 0, 'iFunctionId' => $request->iFunctionId])->delete();
            return back()->with('success', 'Function Deleted Successfully!.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function customerfunctionpdf($id)
    {
        try {
            $FunctionMasters = FunctionMaster::orderBy('iFunctionId', 'asc')
                ->where(['functionmaster.iStatus' => 1, 'functionmaster.isDelete' => 0, 'iCustomerId' => $id])
                ->get();
            $Customers = Customer::orderBy('iCustomerId', 'desc')
                ->where(['customer.iStatus' => 1, 'customer.isDelete' => 0])
                ->where("iCustomerId", "=", $id)
                ->first();

            //$data = ['FunctionMasters' => $FunctionMasters, "Customers" => $Customers,'FunctionDetails' => $FunctionDetails];
            $pdf = Pdf::loadView('pdf.FunctionPdf', ['FunctionMasters' => $FunctionMasters, "Customers" => $Customers]);
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
