<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Industry;
use App\Models\Product;
use App\Models\ProductIndustry;
use App\Models\ProductPhotos;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Image;
use App\Models\SubCategory;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        try {
            $ProductName = $request->productName;
            $CategoryId = $request->categoryId;


            $Category = Category::orderBy('strSequenceNo', 'asc')->get();
            $SubCategory = SubCategory::orderBy('subcategoryname', 'asc')->get();
            $Product = Product::select(
                'product.productId',
                'product.categoryId',
                'product.productname',
                'product.strSequenceNo',
                DB::raw('(select categoryname from category where category.categoryId=product.categoryId) as categoryname'),
                DB::raw('(select subcategoryname from sub_category where sub_category.sub_categoryId=product.iSubCategoryId) as subcategoryname'),
                DB::raw('(SELECT strphoto FROM productphotos WHERE  productphotos.productid=product.productId ORDER BY product.productId  LIMIT 1) as photo'),
            )
                ->orderBy('productId', 'desc')
                ->where(['product.iStatus' => 1, 'product.isDelete' => 0])
                ->when($request->productName, fn($query, $ProductName) => $query
                    ->where('product.productname', 'like', "%$ProductName%"))
                ->when($request->categoryId, fn($query, $CategoryId) => $query
                    ->where('product.categoryId', '=', $CategoryId))
                ->paginate(25);
            // dd($Product);

            return view('product.index', compact('Product', 'Category', 'SubCategory', 'ProductName', 'CategoryId'));
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function createview(Request $request)
    {
        try {
            $Category = Category::orderBy('strSequenceNo', 'asc')->get();
            $SubCategory = SubCategory::orderBy('subcategoryname', 'asc')->get();
            return view('product.add', compact('Category', 'SubCategory'));
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function getsubcategory(Request $request, $id)
    {

        $datas = SubCategory::where(['iStatus' => 1, 'isDelete' => 0, 'categoryId' => $id])->get();
        $html = '<option selected value="">Select Sub Category Name</option>';
        foreach ($datas as $data) {
            $html .= '<option value="' . $data->sub_categoryId . '">' . $data->subcategoryname . '</option>';
        }
        echo $html;
    }

    public function store(Request $request)
    {
        try {
            $request->validate([
                'categoryId' => 'required',
                'strSequenceNo' => 'required',
                'productname' => 'required|unique:product,productname',
            ], [
                'productname.required' => 'The product name field is required.',
                'productname.unique' => 'The product name must be unique.',
            ]);

            $ProductLoverCase = Str::lower($request->productname);
            $ProductName = str_replace(' ', '-', $ProductLoverCase);

            $Data = Product::create([
                'categoryId' => $request->categoryId,
                'iSubCategoryId' => $request->sub_categoryId ?? 0,
                'strSequenceNo' => $request->strSequenceNo,
                'showOnFooter' => $ShowOnFooter ?? 0,
                'productname' => $request->productname,
                'slugname' => $ProductName,
                'meta_title' => $request->meta_title,
                'meta_description' => $request->meta_description,
                'created_at' => date('Y-m-d H:i:s'),
                'strIP' => $request->ip()
            ]);

            return redirect()->route('product.index')->with('success', 'Product Created Successfully.');
            // return back()->with('success', 'Product Created Successfully.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function editview(Request $request, $id)
    {
        try {
            $Category = Category::orderBy('categoryname', 'asc')->get();
            $data = Product::where(['iStatus' => 1, 'isDelete' => 0, 'productId' => $id])->first();
            // dd($data);
            $SubCategory = SubCategory::orderBy('subcategoryname', 'asc')->get();
            // return view('product.edit', compact('Category', 'data', 'SubCategory'));
            return json_encode($data);
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function update(Request $request)
    {
        // dd($request);
        $id = $request->productId;
        try {
            $request->validate([
                'categoryId' => 'required',
                'strSequenceNo' => 'required',
                'productname' => 'required|unique:product,productname,' . $id . ',productId',
            ], [
                'productname.required' => 'The product name field is required.',
                'productname.unique' => 'The product name must be unique.',
            ]);

            $ProductLoverCase = Str::lower($request->productname);
            $ProductName = str_replace(' ', '-', $ProductLoverCase);

            $update = Product::where(['iStatus' => 1, 'isDelete' => 0, 'productId' => $id])
                ->update([
                    'categoryId' => $request->categoryId,
                    'iSubCategoryId' => $request->sub_categoryId ?? 0,
                    'strSequenceNo' => $request->strSequenceNo,
                    'showOnFooter' => $ShowOnFooter ?? 0,
                    'productname' => $request->productname,
                    'slugname' => $ProductName,
                    'meta_title' => $request->meta_title,
                    'meta_description' => $request->meta_description,
                    'updated_at' => date('Y-m-d H:i:s')
                ]);
            
            return redirect()->route('product.index', ['page' => $request->page])
                ->with('success', 'Product Updated Successfully.');    
            
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }


    public function delete(Request $request)
    {
        try {
            $delete = ProductPhotos::where(['iStatus' => 1, 'isDelete' => 0, 'productid' => $request->productId])->get();

            $root = $_SERVER['DOCUMENT_ROOT'];
            $destinationpath = $root . '/Product/';
            $destinationpath1 = $root . '/Product/Thumbnail/';

            foreach ($delete as $deletes) {
                if (file_exists($destinationpath1 . $deletes->strphoto)) {
                    unlink($destinationpath1 . $deletes->strphoto);
                }
                if (file_exists($destinationpath . $deletes->strphoto)) {
                    unlink($destinationpath . $deletes->strphoto);
                }
            }

            ProductPhotos::where(['iStatus' => 1, 'isDelete' => 0, 'productId' => $request->productId])->delete();

            Product::where(['iStatus' => 1, 'isDelete' => 0, 'productId' => $request->productId])->delete();
            
            return redirect()->route('product.index', ['page' => $request->page])
                ->with('success', 'Product Deleted Successfully.');    
            
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    //Product Image Delete In Edit Page
    public function productimage(Request $request, $id)
    {
        // dd($id);
        try {
            $delete = DB::table('productphotos')->where(['isDelete' => 0, 'productphotosid' => $id])->first();

            $root = $_SERVER['DOCUMENT_ROOT'];
            $destinationpath = $root . '/Product/';
            $destinationpath1 = $root . '/Product/Thumbnail/';
            if (file_exists($destinationpath1 . $delete->strphoto)) {
                unlink($destinationpath1 . $delete->strphoto);
            }
            if (file_exists($destinationpath . $delete->strphoto)) {
                unlink($destinationpath . $delete->strphoto);
            }

            DB::table('productphotos')->where(['isDelete' => 0, 'productphotosid' => $id])->delete();

            $count = DB::table('productphotos')->where(['isDelete' => 0, 'productid' => $delete->productid])->count();

            echo $count;
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    //Product Photos Listing Page
    public function productphotos(Request $request, $id)
    {
        try {
            $datas = Productphotos::orderby('productphotosid', 'desc')->where(['isDelete' => 0, 'productid' => $id])->paginate(5);
            $Product = Product::where(['isDelete' => 0, 'productid' => $id])->first();
            $count = $datas->count();
            return view('product.photoslist', compact('datas', 'count', 'Product', 'id'));
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function productphotosstore(Request $request)
    {
        try {
            $request->validate([
                'strphoto' => 'required',
            ]);

            $img = "";
            if ($request->hasFile('strphoto')) {
                $root = $_SERVER['DOCUMENT_ROOT'];
                $image = $request->file('strphoto');
                $imgName = time() . '_' . mt_rand(1000, 9999) . '.' . $image->getClientOriginalExtension();
                $destinationPath = $root . '/Product/Thumbnail/';
                if (!file_exists($destinationPath)) {
                    mkdir($destinationPath, 0755, true);
                }
                $img = Image::make($image->getRealPath());
                if ($img->width() > $img->height()) {
                    $img->rotate(270);
                }
                $img->resize(540, 720, function ($constraint) {
                    $constraint->aspectRatio();
                })->save($destinationPath . '/' . $imgName);

                $destinationpath = $root . '/Product/';
                $image->move($destinationpath, $imgName);
            }



            $Data = ProductPhotos::create([
                'productid' => $request->productId,
                'strphoto' => $imgName,
                'created_at' => date('Y-m-d H:i:s'),
                'strIP' => $request->ip()
            ]);

            return back()->with('success', 'Product Photos Created Successfully.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    //In Product Photos Listing Page Photo Delete
    public function productphotosdelete(Request $request)
    {
        try {
            $delete = DB::table('productphotos')->where(['isDelete' => 0, 'productphotosid' => $request->productphotosid])->first();

            $root = $_SERVER['DOCUMENT_ROOT'];
            $destinationpath = $root . '/Product/';
            $destinationpath1 = $root . '/Product/Thumbnail/';
            if ($delete->strphoto) {
                unlink($destinationpath1  . $delete->strphoto);
            }
            if ($delete->strphoto) {
                unlink($destinationpath  . $delete->strphoto);
            }

            DB::table('productphotos')->where(['isDelete' => 0, 'productphotosid' => $request->productphotosid])->delete();
            return back()->with('success', 'Product Photo Deleted Successfully!.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }
}
