<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ImageCategory;
use App\Models\Image;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ImageCategoryController extends Controller
{
    public function index(Request $request)
    {
       
        try {
            $ImageCategory = ImageCategory::orderBy('id', 'DESC')->paginate(env('PER_PAGE'));
            return view('ImageCategory.index', compact('ImageCategory'));
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }
    public function store(Request $request)
    {
        try {
            $request->validate([
                'Imagecategoryname' => 'required',
            ]);
            $CategoryLoverCase = Str::lower($request->Imagecategoryname);
            $Categoryslug = str_replace(' ', '-', $CategoryLoverCase);

            $Data = ImageCategory::create([
                'Imagecategoryname' => $request->Imagecategoryname ?? 0,
                'slugname' => $Categoryslug,
                'created_at' => date('Y-m-d H:i:s'),
                'strIP' => $request->ip()
            ]);
            if ($Data) {
                return redirect()->route('ImageCategory.index')->with('success', 'Image Category Created Successfully.');
            } else {
                return back()->with('error', 'Invalid request.');
            }
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }
    public function editview(Request $request, $id = null)
    {
        try {
            $data = ImageCategory::where(['iStatus' => 1, 'isDelete' => 0, 'id' => $id])->first();
            echo json_encode($data);
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }
    public function update(Request $request)
    {
        try {
            $id = $request->categoryId;
            $request->validate([
                'EditImagecategoryname' => 'required',
            ]);
            $CategoryLoverCase = Str::lower($request->EditImagecategoryname);
            $CategoryName = str_replace(' ', '-', $CategoryLoverCase);

            $update = ImageCategory::where(['iStatus' => 1, 'isDelete' => 0, 'id' => $request->categoryId])
                ->update([
                    'Imagecategoryname' => $request->EditImagecategoryname,
                    'slugname' => $CategoryName,
                    'updated_at' => date('Y-m-d H:i:s'),
                ]);

            return redirect()->route('ImageCategory.index', ['page' => $request->page])
                ->with('success', 'Image Category Updated Successfully.');
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }
    public function delete(Request $request)
    {
        try {
            $ImageCategory = ImageCategory::where(['iStatus' => 1, 'isDelete' => 0, 'id' => $request->categoryId])->delete();
            return redirect()->route('ImageCategory.index', ['page' => $request->page])
                ->with('success', 'Image Category Deleted Successfully!.');
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    // Image add section
    public function Add_Image_index(Request $request)
    {

        try {
            $Category = ImageCategory::orderBy('id', 'desc')->get();
            $image = Image::select('image.*', 'imagecategory.Imagecategoryname')
                ->leftjoin('imagecategory', 'image.Imagecategoryid', '=', 'imagecategory.id')
                ->orderBy('image.id', 'desc')->paginate(10);
            return view('ImageCategory.AddImageindex', compact('Category', 'image'));
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }
    public function Image_store(Request $request)
    {
        try {
            $img = "";
            if ($request->hasFile('photo')) {
                $root = $_SERVER['DOCUMENT_ROOT'];
                $image = $request->file('photo');
                $img = time() . '.' . $image->getClientOriginalExtension();
                //$destinationpath = $root . '/ImageCategory/';
                $destinationpath = $root . '/Caterer/ImageCategory/';
                if (!file_exists($destinationpath)) {
                    mkdir($destinationpath, 0755, true);
                }
                $image->move($destinationpath, $img);
            }
            $Data = Image::create([
                'Imagecategoryid' => $request->categoryId,
                'photo' => $img,
                'created_at' => date('Y-m-d H:i:s'),
                'strIP' => $request->ip(),
            ]);
            return back()->with('success', 'Image Created Successfully.');
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }
    public function image_delete(Request $request)
    {
        try {
            $delete = Image::where(['iStatus' => 1, 'isDelete' => 0, 'id' => $request->imageId])->first();
            $root = $_SERVER['DOCUMENT_ROOT'];
            //$destinationpath = $root . '/ImageCategory/';
            $destinationpath = $root . '/Caterer/ImageCategory/';
            if ($delete->photo) {
                unlink($destinationpath  . $delete->photo);
            }
            Image::where(['iStatus' => 1, 'isDelete' => 0, 'id' => $request->imageId])->delete();

            return redirect()->route('ImageCategory.AddImageindex', ['page' => $request->page])
                ->with('success', 'Image Deleted Successfully.');
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }
    
     public function my_image_data(Request $request)
    {
        $iItemCategoryId = $request->iItemCategoryId;
        try {
            $ItemCategory = ImageCategory::orderBy('id', 'desc')->get();
            $Imagedata = Image::orderBy('id', 'DESC')
                ->when($request->iItemCategoryId, fn($query, $iItemCategoryId) => $query
                    ->where('image.Imagecategoryid', '=', $iItemCategoryId))
                ->get();
            return view('ImageCategory.Mydata', compact('ItemCategory', 'Imagedata','iItemCategoryId'));
        } catch (\Throwable $th) {
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }
}
