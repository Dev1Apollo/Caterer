@extends('layouts.app')

@section('title', 'Order Form List')

@section('content')
    <meta name="csrf-token" id="csrf-token" content="{{ csrf_token() }}">
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">

                @if ($errors->any())
                    {{-- <h5 style="color:red">Following errors exists in your excel file</h5>  --}}

                    @foreach ($errors->all() as $error)
                        <li style="color:red">{{ $error }}</li>
                    @endforeach

                @endif
                {{-- Alert Messages --}}
                @include('common.alert')

                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <div>
                                <h4 class="mb-sm-0">Order Form List</h4>
                            </div>
                            <div>
                                <a href="#" data-bs-toggle="modal" title="Add" data-bs-target="#addRecordModal"
                                    class="btn btn-sm btn-success">
                                    <i data-feather="plus"></i> Add New
                                </a>
                                <a href="{{ route('customer.index') }}" title="Back" class="btn btn-sm btn-success">
                                    <i data-feather="arrow-left"></i> Back
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <table id="scroll-horizontal" class="table nowrap align-middle" style="width:100%">

                                    <thead>
                                        <tr>
                                            <th scope="col">Sr. No</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Item Name</th>
                                            <th scope="col">Qty</th>
                                            <th scope="col">Kg</th>
                                            <th scope="col">Gm</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $i = 1; ?>
                                        @foreach ($OrderForm as $itemOrder)
                                            <tr class="text-center">
                                                <td>
                                                    {{ $i + $OrderForm->perPage() * ($OrderForm->currentPage() - 1) }}
                                                </td>
                                                <td class="text-center">{{ $itemOrder->strItemSubCategoryName }}</td>
                                                <td class="text-center">{{ $itemOrder->strItemMasterName }}</td>
                                                <td class="text-center">{{ $itemOrder->strCount ?? '-' }}</td>
                                                <td class="text-center">{{ $itemOrder->strKG ?? '-' }}</td>
                                                <td class="text-center">{{ $itemOrder->strGram ?? '-' }}</td>



                                                <td class="text-center">
                                                    <a class="mx-1 edit-btn" title="Edit" data-bs-toggle="modal"
                                                        title="Delete" data-bs-target="#editRecordModal"
                                                        onclick="getData(<?= $itemOrder->iOrderFormMasterId ?>);">
                                                        <i class="far fa-edit"></i>
                                                    </a>
                                                    <a class="mx-1" href="#" data-bs-toggle="modal" title="Delete"
                                                        data-bs-target="#deleteRecordModal"
                                                        onclick="deleteData(<?= $itemOrder->iOrderFormMasterId ?>);">
                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <?php $i++; ?>
                                        @endforeach
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-center mt-3">
                                    {{ $OrderForm->appends(request()->except('page'))->links() }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>



    <!--Delete Modal -->
    <div class="modal fade zoomIn" id="deleteRecordModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        id="btn-close"></button>
                </div>
                <div class="modal-body">
                    <div class="mt-2 text-center">
                        <lord-icon src="https://cdn.lordicon.com/gsqxdxog.json" trigger="loop"
                            colors="primary:#f7b84b,secondary:#f06548" style="width:100px;height:100px"></lord-icon>
                        <div class="mt-4 pt-2 fs-15 mx-4 mx-sm-5">
                            <h4>Are you Sure ?</h4>
                            <p class="text-muted mx-4 mb-0">Are you Sure You want to Remove this Record
                                ?</p>
                        </div>
                    </div>
                    <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                        <a class="btn btn-danger" href="{{ route('logout') }}"
                            onclick="event.preventDefault(); document.getElementById('user-delete-form').submit();">
                            Yes,
                            Delete It!
                        </a>
                        <button type="button" class="btn w-sm btn-light" data-bs-dismiss="modal">Close</button>
                        <form id="user-delete-form" method="POST" action="{{ route('orderform.delete') }}">
                            @csrf
                            @method('DELETE')
                            <input type="hidden" name="iOrderFormMasterId" id="deleteid" value="">

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End Delete Modal -->

    <!--Add Modal -->
    <div class="modal fade zoomIn" id="addRecordModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Add Order Form</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        id="btn-close"></button>
                </div>
                <form id="user-delete-form" method="POST" action="{{ route('orderform.store') }}">
                    <input type="hidden" name="iCustomerId" id="iCustomerId" value="{{ $id }}">
                    <div class="modal-body">
                        <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                            @csrf
                            <div class="row gy-4">
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Category Name
                                        <select class="form-control" name="iItemSubCategoryId" id="iItemSubCategoryId"
                                            required>
                                            <option value="">Select Category Name</option>
                                            @foreach ($ItemSubCategory as $subcategory)
                                                <option value=" {{ $subcategory->iItemSubCategoryId }}">
                                                    {{ $subcategory->strItemSubCategoryName }}</option>
                                            @endforeach
                                        </select>
                                        @error('iItemSubCategoryId')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Item Name
                                        <select class="form-control" name="iItemMasterId" id="iItemMasterId" required>
                                            <option value="">Select Items </option>

                                        </select>
                                        @error('iItemMasterId')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-lg-6 col-md-6" id="QtyDiv">
                                    <div>
                                        <span style="color:red;"></span>Qty
                                        <input type="text" class="form-control" placeholder="Enter Qty"
                                            maxlength="3" oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                            name="strCount" autocomplete="off" value="{{ old('strCount') }}">
                                        @error('strCount')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>


                                <div class="col-lg-6 col-md-6" id="KgDiv">
                                    <div>
                                        <span style="color:red;"></span>Kg
                                        <input type="text" class="form-control" placeholder="Enter Kg" name="strKG"
                                            autocomplete="off" value="{{ old('strKG') }}">
                                        @error('strKG')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6" id="GmDiv">
                                    <span style="color:red;"></span>Gm
                                    <input type="text" class="form-control" placeholder="Enter Gm" name="strGram"
                                        autocomplete="off" value="{{ old('strGram') }}">
                                    @error('strGram')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-success">Submit</button>
                                    <a class="btn btn-primary float-right mr-3"
                                        href="{{ route('orderform.index', $id) }}">Clear</a>
                                </div>
                            </div>

                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--End Add Modal -->


    <!--edit Modal -->
    <div class="modal fade zoomIn" id="editRecordModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Edit Order Form</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        id="btn-close"></button>
                </div>
                <form id="user-delete-form" method="POST" action="{{ route('orderform.edit') }}">
                    <div class="modal-body">
                        <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                            @csrf
                            <input type="hidden" name="iOrderFormMasterId" id="iOrderFormMasterId" value="">
                            <div class="row gy-4">
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Category Name
                                        <select class="form-control" name="iItemSubCategoryId"
                                            id="EditiItemSubCategoryId" required>
                                            <option disabled value="">Select Category Name</option>
                                            @foreach ($ItemSubCategory as $subcategory)
                                                <option value="{{ $subcategory->iItemSubCategoryId }}">
                                                    {{ $subcategory->strItemSubCategoryName }}</option>
                                            @endforeach
                                        </select>
                                        @error('iItemSubCategoryId')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Item Name
                                        <select class="form-control" name="iItemMasterId" id="EditiItemMasterId"
                                            required>
                                            <option value="">Select Items </option>
                                            @foreach ($ItemMasters as $itemmaster)
                                                <option value="{{ $itemmaster->iItemMasterId }}">
                                                    {{ $itemmaster->strItemMasterName }}</option>
                                            @endforeach
                                        </select>
                                        @error('iItemMasterId')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-lg-6 col-md-6" id="EditQtyDiv">
                                    <div>
                                        <span style="color:red;"></span>Qty
                                        <input type="text" class="form-control" placeholder="Enter Qty"
                                            maxlength="3" oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                            name="strCount" id="EditstrCount" autocomplete="off" value="">
                                        @error('strCount')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>


                                <div class="col-lg-6 col-md-6" id="EditKgDiv">
                                    <div>
                                        <span style="color:red;"></span>Kg
                                        <input type="text" class="form-control" placeholder="Enter Kg" name="strKG"
                                            id="EditstrKG" autocomplete="off" value="">
                                        @error('strKG')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6" id="EditGmDiv">
                                    <span style="color:red;"></span>Gm
                                    <input type="text" class="form-control" placeholder="Enter Gm" name="strGram"
                                        id="EditstrGram" autocomplete="off" value="">
                                    @error('strGram')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">Update</button>
                        <a class="btn btn-primary float-right mr-3"
                                        href="{{ route('orderform.index',$id) }}">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--End edit Modal -->

@endsection

@section('scripts')


    <script>
        function deleteData(id) {
            $("#deleteid").val(id);
        }

        function getData(id) {
            var url = "{{ route('orderform.edit', ':id') }}";
            url = url.replace(":id", id);
            $.ajax({
                type: 'GET',
                url: url,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function(response) {
                    var obj = JSON.parse(response);

                    {{--  $("#EditiItemSubCategoryId").val(obj.iItemSubCategoryId);  --}}
                    $("#EditiItemSubCategoryId").val(obj.iItemSubCategoryId).trigger('change');

                    setTimeout(() => {
                        $("#EditiItemMasterId").val(obj.iItemMasterId); // Preselect item
                    }, 500); // Slight delay to ensure items are loaded

                    $("#EditiItemMasterId").val(obj.iItemMasterId);
                    $("#EditstrCount").val(obj.strCount);
                    $("#EditstrKG").val(obj.strKG);
                    $("#EditstrGram").val(obj.strGram);
                    $("#iOrderFormMasterId").val(id);

                    if (obj.strCount) {
                        $("#EditQtyDiv").removeAttr("hidden");
                    } else {
                        $('#EditQtyDiv').attr("hidden", true);
                    }

                    if (obj.strKG) {
                        $("#EditKgDiv").removeAttr("hidden");
                    } else {
                        $('#EditKgDiv').attr("hidden", true);
                    }

                    if (obj.strGram) {
                        $("#EditGmDiv").removeAttr("hidden");
                    } else {
                        $('#EditGmDiv').attr("hidden", true);
                    }


                }
            });
        }

        // Define the click event listener for the edit button
        $(document).on('click', '.edit-btn', function() {
            var id = $(this).data('id'); // Retrieve the ID from data attributes if needed            
        });
    </script>

    <script>
        $(document).ready(function() {
            $("#KgDiv, #GmDiv, #QtyDiv").attr("hidden", true);
            $("#EditKgDiv, #EditGmDiv, #EditQtyDiv").attr("hidden", true);
        });

        $("#iItemSubCategoryId").change(function() {

            var iItemSubCategoryId = $(this).val();
            var url = "{{ route('orderform.getitems', ':id') }}";
            url = url.replace(":id", iItemSubCategoryId);
            $.ajax({
                type: 'GET',
                url: url,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function(response) {
                    $("#iItemMasterId").html(response);
                }
            });

            // Show/Hide specific input fields based on the category
            if (iItemSubCategoryId == 1 || iItemSubCategoryId == 4) {
                $("#KgDiv").removeAttr("hidden");
                $("#GmDiv").removeAttr("hidden");
                $("#QtyDiv").attr("hidden", true);
            } else if (iItemSubCategoryId == 2 || iItemSubCategoryId == 3) {
                $("#KgDiv").attr("hidden", true);
                $("#GmDiv").attr("hidden", true);
                $("#QtyDiv").removeAttr("hidden");
            } else {
                $("#KgDiv").attr("hidden", true);
                $("#GmDiv").attr("hidden", true);
                $("#QtyDiv").attr("hidden", true);

            }
        });

        $("#EditiItemSubCategoryId").change(function() {

            var iItemSubCategoryId = $(this).val();
            var url = "{{ route('orderform.getitems', ':id') }}";
            url = url.replace(":id", iItemSubCategoryId);
            $.ajax({
                type: 'GET',
                url: url,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function(response) {
                    $("#EditiItemMasterId").html(response);
                }
            });

            // Show/Hide specific input fields based on the category
            if (iItemSubCategoryId == 1 || iItemSubCategoryId == 4) {
                $("#EditKgDiv").removeAttr("hidden");
                $("#EditGmDiv").removeAttr("hidden");
                $("#EditQtyDiv").attr("hidden", true);
            } else if (iItemSubCategoryId == 2 || iItemSubCategoryId == 3) {
                $("#EditKgDiv").attr("hidden", true);
                $("#EditGmDiv").attr("hidden", true);
                $("#EditQtyDiv").removeAttr("hidden");
            } else {
                $("#EditKgDiv").attr("hidden", true);
                $("#EditGmDiv").attr("hidden", true);
                $("#EditQtyDiv").attr("hidden", true);

            }
        });
    </script>



@endsection
