<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Dealer;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class DealerController extends Controller
{
    public function index(Request $request)
    {
        try {
            $strState = $request->State;
            $strCity = $request->City;
            $Deal = Dealer::orderBy('dealerId', 'desc')
                ->where(['iStatus' => 1, 'isDelete' => 0]);

            if ($request->State != "") {
                $Deal->where('dealer.state', '=', $request->State);
            };
            if ($request->City != "") {
                //  ->when($request->strStatus, fn ($query, $Status) => $query
                $Deal->where('dealer.city', '=', $request->City);
            };
            $Dealer = $Deal->paginate(25);

            // ->when($request->state, fn ($query, $strState) => $query
            //     ->where('dealer.state', 'like', "%" . $strState . "%"))
            // ->when($request->City, fn ($query, $strCity) => $query
            //     ->where('dealer.city', 'like', "%" . $strCity . "%"))
            // ->toSql();
            // dd($Dealer);

            return view('dealer.index', compact('Dealer', 'strState', 'strCity'));
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function createview(Request $request)
    {
        try {
            return view('dealer.add');
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
                'strName' => 'required|unique:dealer,strName',
                'strEmail' => 'required',
                'strMobile' => 'required',
                'address1' => 'required',
                'address2' => 'required',
                'city' => 'required',
                'pincode' => 'required',
                'state' => 'required',
            ], [
                'strName.required' => 'The name field is required.',
                'strName.unique' => 'The name must be unique.',
            ]);

            $Data = Dealer::create([
                'strName' => $request->strName,
                'strEmail' => $request->strEmail,
                'strMobile' => $request->strMobile,
                'address1' => $request->address1,
                'address2' => $request->address2,
                'city' => $request->city,
                'pincode' => $request->pincode,
                'state' => $request->state,
                'created_at' => date('Y-m-d H:i:s'),
                'strIP' => $request->ip()
            ]);

            return redirect()->route('dealer.index')->with('success', 'Dealer Created Successfully.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function editview(Request $request, $id)
    {
        try {
            $data = Dealer::where(['iStatus' => 1, 'isDelete' => 0, 'dealerId' => $id])->first();

            return view('dealer.edit', compact('data'));
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
                'strName' => 'required|unique:dealer,strName,' . $id . ',dealerId',
                'strEmail' => 'required',
                'strMobile' => 'required',
                'address1' => 'required',
                'address2' => 'required',
                'city' => 'required',
                'pincode' => 'required',
                'state' => 'required',
            ], [
                'strName.required' => 'The name field is required.',
                'strName.unique' => 'The name must be unique.',
            ]);

            $update = Dealer::where(['iStatus' => 1, 'isDelete' => 0, 'dealerId' => $id])
                ->update([
                    'strName' => $request->strName,
                    'strEmail' => $request->strEmail,
                    'strMobile' => $request->strMobile,
                    'address1' => $request->address1,
                    'address2' => $request->address2,
                    'city' => $request->city,
                    'pincode' => $request->pincode,
                    'state' => $request->state,
                    'updated_at' => date('Y-m-d H:i:s')
                ]);

            return redirect()->route('dealer.index')->with('success', 'Dealer Updated Successfully.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }


    public function delete(Request $request)
    {
        try {
            Dealer::where(['iStatus' => 1, 'isDelete' => 0, 'dealerId' => $request->dealerId])->delete();

            return back()->with('success', 'Dealer Deleted Successfully!.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }
}
