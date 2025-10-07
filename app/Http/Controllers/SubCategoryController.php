<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SubCategory;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use App\Models\Category;

class SubCategoryController extends Controller
{
    public function index(Request $request)
    {
        try {
            $SubCategory = SubCategory::select('sub_category.*', 'category.categoryname')
                ->join('category', 'category.categoryId', '=', 'sub_category.categoryId')
                ->orderBy('strSequenceNo', 'desc')->paginate(10);
            $Category = Category::orderBy('categoryId', 'desc')->get();
            return view('subcategory.index', compact('SubCategory', 'Category'));
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function create(Request $request)
    {
        try {
            $request->validate([
                //'subcategoryname' => 'required|unique:sub_category,subcategoryname',
                'subcategoryname' => 'required',
            ], [
                'subcategoryname.required' => 'The sub category name field is required.',
                'subcategoryname.unique' => 'The sub category name must be unique.',
            ]);

            $img = "";
            if ($request->hasFile('photo')) {
                $root = $_SERVER['DOCUMENT_ROOT'];
                $image = $request->file('photo');
                $img = time() . '.' . $image->getClientOriginalExtension();
                $destinationpath = $root . '/Caterer/SubCategory/';
                if (!file_exists($destinationpath)) {
                    mkdir($destinationpath, 0755, true);
                }
                $image->move($destinationpath, $img);
            }

            $CategoryLoverCase = Str::lower($request->subcategoryname);
            $CategoryName = str_replace(' ', '-', $CategoryLoverCase);


            $Data = SubCategory::create([
                'categoryId' => $request->categoryId,
                'subcategoryname' => $request->subcategoryname,
                'strSequenceNo' => $request->strSequenceNo,
                'slugname' => $CategoryName,
                'photo' => $img,
                'created_at' => date('Y-m-d H:i:s'),
                'strIP' => $request->ip(),
                'meta_title' => $request->meta_title,
                'meta_description' => $request->meta_description,
            ]);

            return back()->with('success', 'SubCategory Created Successfully.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function editview(Request $request, $id)
    {
        try {
            $data = SubCategory::where(['iStatus' => 1, 'isDelete' => 0, 'sub_categoryId' => $id])->first();

            echo json_encode($data);
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function update(Request $request)
    {
        try {
            $id = $request->sub_categoryId;
            $request->validate([
                //'subcategoryname' => 'required|unique:sub_category,subcategoryname,' . $id . ',sub_categoryId',
                'subcategoryname' => 'required',
            ], [
                'subcategoryname.required' => 'The sub category name field is required.',
                'subcategoryname.unique' => 'The sub category name must be unique.',
            ]);

            $img = "";
            if ($request->hasFile('photo')) {
                $root = $_SERVER['DOCUMENT_ROOT'];
                $image = $request->file('photo');
                $img = time() . '.' . $image->getClientOriginalExtension();
                $destinationpath = $root . '/Caterer/SubCategory/';
                if (!file_exists($destinationpath)) {
                    mkdir($destinationpath, 0755, true);
                }
                $image->move($destinationpath, $img);
                $oldImg = $request->input('hiddenPhoto') ? $request->input('hiddenPhoto') : null;

                if ($oldImg != null || $oldImg != "") {
                    if (file_exists($destinationpath . $oldImg)) {
                        unlink($destinationpath . $oldImg);
                    }
                }
            } else {
                $oldImg = $request->input('hiddenPhoto');
                $img = $oldImg;
            }

            $CategoryLoverCase = Str::lower($request->Editcategoryname);
            $CategoryName = str_replace(' ', '-', $CategoryLoverCase);

            $update = SubCategory::where(['iStatus' => 1, 'isDelete' => 0, 'sub_categoryId' => $request->sub_categoryId])
                ->update([
                    'categoryId' => $request->categoryId,
                    'subcategoryname' => $request->subcategoryname,
                    'strSequenceNo' => $request->strSequenceNo,
                    'slugname' => $CategoryName,
                    'photo' => $img,
                    'updated_at' => date('Y-m-d H:i:s'),
                    'meta_title' => $request->meta_title,
                    'meta_description' => $request->meta_description,
                ]);
            
            return redirect()->route('subcategory.index', ['page' => $request->page])
                ->with('success', 'SubCategory Updated Successfully.');
            
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
            $delete = SubCategory::where(['iStatus' => 1, 'isDelete' => 0, 'sub_categoryId' => $request->sub_categoryId])->first();

            $root = $_SERVER['DOCUMENT_ROOT'];
            $destinationpath = $root . '/Caterer/SubCategory/';
            if ($delete->photo) {
                unlink($destinationpath  . $delete->photo);
            }


            SubCategory::where(['iStatus' => 1, 'isDelete' => 0, 'sub_categoryId' => $request->sub_categoryId])->delete();
            
            return redirect()->route('subcategory.index', ['page' => $request->page])
                ->with('success', 'SubCategory Deleted Successfully.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function imagedelete(Request $request)
    {
        // dd('imagedelete');
        try {
            $delete = SubCategory::where(['iStatus' => 1, 'isDelete' => 0, 'sub_categoryId' => $request->sub_categoryId])->first();

            $root = $_SERVER['DOCUMENT_ROOT'];
            $destinationpath = $root . '/Caterer/SubCategory/';
            if ($delete->photo) {
                unlink($destinationpath  . $delete->photo);
            }


            $update = SubCategory::where(['iStatus' => 1, 'isDelete' => 0, 'sub_categoryId' => $request->sub_categoryId])
                ->update([
                    'photo' => null,
                    'updated_at' => date('Y-m-d H:i:s'),
                ]);


            return back()->with('success', 'SubCategory Image Deleted Successfully!.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }
}
