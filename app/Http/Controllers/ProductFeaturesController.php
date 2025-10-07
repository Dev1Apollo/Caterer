<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductFeatures;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class ProductFeaturesController extends Controller
{
    public function index(Request $request,$id)
    {
        // dd($id);
        try {
            
            $ProductName = Product::orderBy('productId', 'desc')
                        ->where(['iStatus' => 1, 'isDelete' => 0, 'productId' => $id])
                        ->first();
            
            $Product = ProductFeatures::orderBy('product_featuresId', 'desc')
                        ->where(['iStatus' => 1, 'isDelete' => 0, 'iProductId' => $id])
                        ->paginate(10);
                    // dd($Product)    ;
    
            return view('product.features', compact('Product','id','ProductName'));
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }    
    }

    public function create(Request $request)
    {
        try{
            $request->validate([
            'strLabel' => 'required',
            'strValue' => 'required',
        ]);

            $Data =ProductFeatures::create([
                'iProductId' => $request->iProductId,
                'strLabel' => $request->strLabel,
                'strValue' => $request->strValue,
                'created_at' => date('Y-m-d H:i:s'),
                'strIP' => $request->ip(),
            ]);
    
            return back()->with('success', 'Product Specifications Created Successfully.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }    
    }

    public function editview(Request $request)
    {
        // dd($request);
        try{
            $data = ProductFeatures::where(['iStatus' => 1, 'isDelete' => 0, 'product_featuresId' => $request->id])->first();
    // dd($data);
            echo json_encode($data);
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }    
    }

    public function update(Request $request)
    {
        // dd($request);
        try{
            
            $request->validate([
                'strLabel' => 'required',
            'strValue' => 'required',
            ]);
    
            $update = ProductFeatures::where(['iStatus' => 1, 'isDelete' => 0, 'product_featuresId' => $request->product_featuresId])
                ->update([
                    'strLabel' => $request->strLabel,
                    'strValue' => $request->strValue,
                    'updated_at' => date('Y-m-d H:i:s'),
                ]);
    
            return back()->with('success', 'Product Specifications Updated Successfully.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }    
    }


    public function delete(Request $request)
    {
        // dd('delete');
        try{
            ProductFeatures::where(['iStatus' => 1, 'isDelete' => 0, 'product_featuresId' => $request->product_featuresId])->delete();
            
            return back()->with('success', 'Product Specifications Deleted Successfully!.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

}
