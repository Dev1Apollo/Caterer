<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class CategoryController extends Controller
{
    public function index(Request $request)
    {
        try {
            $Category = Category::orderBy('categoryId', 'asc')->paginate(env('PER_PAGE'));

            return view('category.index', compact('Category'));
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
                'categoryname' => 'required|unique:category,categoryname',
            ], [
                'categoryname.required' => 'The category name field is required.',
                'categoryname.unique' => 'The category name must be unique.',
            ]);

            $img = "";
            if ($request->hasFile('photo')) {
                $root = $_SERVER['DOCUMENT_ROOT'];
                $image = $request->file('photo');
                $img = time() . '.' . $image->getClientOriginalExtension();
                $destinationpath = $root . '/Caterer/Category/';
                if (!file_exists($destinationpath)) {
                    mkdir($destinationpath, 0755, true);
                }
                $image->move($destinationpath, $img);
            }

            $CategoryLoverCase = Str::lower($request->categoryname);
            $CategoryName = str_replace(' ', '-', $CategoryLoverCase);


            $Data = Category::create([
                'categoryname' => $request->categoryname,
                'strSequenceNo' => $request->strSequenceNo,
                'slugname' => $CategoryName,
                'photo' => $img,
                'created_at' => date('Y-m-d H:i:s'),
                'strIP' => $request->ip(),
                'meta_title' => $request->meta_title,
                'meta_description' => $request->meta_description,
            ]);

            return back()->with('success', 'Category Created Successfully.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function editview(Request $request, $id)
    {
        try {
            $data = Category::where(['iStatus' => 1, 'isDelete' => 0, 'categoryId' => $id])->first();

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
            $id = $request->categoryId;
            $request->validate([
                'Editcategoryname' => 'required|unique:category,categoryname,' . $id . ',categoryId',
            ], [
                'Editcategoryname.required' => 'The category name field is required.',
                'Editcategoryname.unique' => 'The category name must be unique.',
            ]);

            $img = "";
            if ($request->hasFile('photo')) {
                $root = $_SERVER['DOCUMENT_ROOT'];
                $image = $request->file('photo');
                $img = time() . '.' . $image->getClientOriginalExtension();
                $destinationpath = $root . '/Caterer/Category/';
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

            $update = Category::where(['iStatus' => 1, 'isDelete' => 0, 'categoryId' => $request->categoryId])
                ->update([
                    'categoryname' => $request->Editcategoryname,
                    'strSequenceNo' => $request->strSequenceNo,
                    'slugname' => $CategoryName,
                    'photo' => $img,
                    'updated_at' => date('Y-m-d H:i:s'),
                    'meta_title' => $request->meta_title,
                    'meta_description' => $request->meta_description,
                ]);

            return redirect()->route('category.index', ['page' => $request->page])
                ->with('success', 'Category Updated Successfully.');
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
            $delete = Category::where(['iStatus' => 1, 'isDelete' => 0, 'categoryId' => $request->categoryId])->first();

            $root = $_SERVER['DOCUMENT_ROOT'];
            $destinationpath = $root . '/Caterer/Category/';
            if ($delete->photo) {
                unlink($destinationpath  . $delete->photo);
            }


            Category::where(['iStatus' => 1, 'isDelete' => 0, 'categoryId' => $request->categoryId])->delete();
            
            return redirect()->route('category.index', ['page' => $request->page])
                ->with('success', 'Category Deleted Successfully!.');
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
            $delete = Category::where(['iStatus' => 1, 'isDelete' => 0, 'categoryId' => $request->categoryId])->first();

            $root = $_SERVER['DOCUMENT_ROOT'];
            $destinationpath = $root . '/Caterer/Category/';
            if ($delete->photo) {
                unlink($destinationpath  . $delete->photo);
            }


            $update = Category::where(['iStatus' => 1, 'isDelete' => 0, 'categoryId' => $request->categoryId])
                ->update([
                    'photo' => null,
                    'updated_at' => date('Y-m-d H:i:s'),
                ]);


            return back()->with('success', 'Category Image Deleted Successfully!.');
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }
}
