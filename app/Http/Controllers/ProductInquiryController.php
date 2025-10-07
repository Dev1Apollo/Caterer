<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ProductInquiry;
use Illuminate\Support\Facades\DB;

class ProductInquiryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $inquiries = ProductInquiry::orderBy('inquiry_id', 'DESC')->where(['iStatus' => 1, 'isDelete' => 0])->paginate(25);
        return view('inquiries.product', compact('inquiries'));
    }


    public function delete(Request $request)
    {
        ProductInquiry::where(['iStatus' => 1, 'isDelete' => 0, 'inquiry_id' => $request->inquiry_id])->delete();

        return back()->with('success', 'Deleted Successfully!.');
    }

    public function viewdetail(Request $request, $id)
    {
        $data = ProductInquiry::where(['iStatus' => 1, 'isDelete' => 0, 'inquiry_id' => $id])->first();

        echo json_encode($data);
    }
}
