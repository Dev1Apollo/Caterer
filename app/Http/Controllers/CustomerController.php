<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Customer;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class CustomerController extends Controller
{
    public function index(Request $request)
    {
        try {
            $Customers = Customer::orderBy('iCustomerId', 'desc')
                ->where(['customer.iStatus' => 1, 'customer.isDelete' => 0])
                ->where("strFunctionDate", ">=", date('Y-m-d'))
                ->paginate(env('PER_PAGE'));
            return view('customer.index', compact('Customers'));
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function createview(Request $request)
    {
        try {

            return view('customer.add');
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
                'strCustomerName' => 'required',
                'strAddress' => 'required',
                // 'iMobileHouse' => 'required',
                // 'iMobileOffice' => 'required',
                'iMobileNo' => 'required',
                'strFunctionName' => 'required',
                'strFunctionDate' => 'required',
                //'strFunctionMorningTime' => 'required',
                //'strFunctionEveningTime' => 'required',
                'strFunctionVanue' => 'required',
            ]);
            $strFunctionDate = date('Y-m-d', strtotime($request->strFunctionDate)) ?? "";
            $Data = Customer::create([
                'strCustomerName' => $request->strCustomerName ?? "",
                'strAddress' => $request->strAddress ?? "",
                'iMobileHouse' => $request->iMobileHouse ?? 0,
                'iMobileOffice' => $request->iMobileOffice ?? 0,
                'iMobileNo' => $request->iMobileNo ?? 0,
                'strFunctionName' => $request->strFunctionName ?? "",
                'strFunctionDate' => $strFunctionDate,
                'strFunctionMorningTime' => $request->strFunctionMorningTime ?? "",
                'strFunctionEveningTime' => $request->strFunctionEveningTime ?? "",
                'strFunctionVanue' => $request->strFunctionVanue ?? "",
                "strRemarks" => $request->strRemarks ?? "",
                'created_at' => date('Y-m-d H:i:s'),
                'strIP' => $request->ip()
            ]);
            if ($Data) {
                return redirect()->route('customer.index')->with('success', 'Customer Created Successfully.');
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
            $datas = Customer::where(['iStatus' => 1, 'isDelete' => 0, 'iCustomerId' => $id])->first();
            //$strFunctionDate = date('Y/m/d',strtotime($datas->strFunctionDate));
            // dd($datas);
            $strFunctionDate = date('Y-m-d', strtotime($datas->strFunctionDate));

            $data = array(
                'iCustomerId' => $datas->iCustomerId,
                'strCustomerName' => $datas->strCustomerName,
                'strAddress' => $datas->strAddress,
                'iMobileHouse' => $datas->iMobileHouse,
                'iMobileOffice' => $datas->iMobileOffice,
                'iMobileNo' => $datas->iMobileNo,
                'strFunctionName' => $datas->strFunctionName,
                'strFunctionDate' => $strFunctionDate,
                'strFunctionMorningTime' => $datas->strFunctionMorningTime,
                'strFunctionEveningTime' => $datas->strFunctionEveningTime,
                'strFunctionVanue' => $datas->strFunctionVanue,
                'strRemarks' => $datas->strRemarks,
            );

            return view('customer.edit', compact('data'));
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function update(Request $request, $id)
    {

        try {
            $request->validate([
                'strCustomerName' => 'required',
                'strAddress' => 'required',
                // 'iMobileHouse' => 'required',
                // 'iMobileOffice' => 'required',
                'iMobileNo' => 'required',
                'strFunctionName' => 'required',
                'strFunctionDate' => 'required',
                //'strFunctionMorningTime' => 'required',
                //'strFunctionEveningTime' => 'required',
                'strFunctionVanue' => 'required',
            ]);
            $strFunctionDate = date('Y-m-d', strtotime($request->strFunctionDate)) ?? "";
            $update = Customer::where(['iStatus' => 1, 'isDelete' => 0, 'iCustomerId' => $id])
                ->update([
                    'strCustomerName' => $request->strCustomerName ?? "",
                    'strAddress' => $request->strAddress ?? "",
                    'iMobileHouse' => $request->iMobileHouse ?? 0,
                    'iMobileOffice' => $request->iMobileOffice ?? 0,
                    'iMobileNo' => $request->iMobileNo ?? 0,
                    'strFunctionName' => $request->strFunctionName ?? "",
                    'strFunctionDate' => $strFunctionDate,
                    'strFunctionMorningTime' => $request->strFunctionMorningTime ?? "",
                    'strFunctionEveningTime' => $request->strFunctionEveningTime ?? "",
                    'strFunctionVanue' => $request->strFunctionVanue ?? "",
                    "strRemarks" => $request->strRemarks ?? "",
                    'updated_at' => date('Y-m-d H:i:s')
                ]);

            //return redirect()->route('product.index')->with('success', 'Customer Updated Successfully.');
            if ($update) {
                return redirect()->route('customer.index')->with('success', 'Customer Updated Successfully.');
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
        // dd('delete');
        try {
            Customer::where(['iStatus' => 1, 'isDelete' => 0, 'iCustomerId' => $request->iCustomerId])->delete();
            
            return redirect()->route('customer.index', ['page' => $request->page])
                ->with('success', 'Customer Deleted Successfully.');    
            
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }
}
