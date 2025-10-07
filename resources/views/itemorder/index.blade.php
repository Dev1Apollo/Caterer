@extends('layouts.app')

@section('title', 'Item Order List')

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
                                <h4 class="mb-sm-0">Item Order List </h4>
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
                                            <th colspan="7" scope="col">Item Order List</th>
                                        </tr>
                                    </thead>
                                    <thead>
                                        <tr>
                                            <th scope="col">Sr. No</th>
                                            <th scope="col">Item Name</th>
                                            <th scope="col">Previous Days</th>
                                            <th scope="col">Morning</th>
                                            <th scope="col">AfterNoon</th>
                                            <th scope="col">Evening</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $i = 1; ?>
                                        @foreach ($ItemOrders as $itemOrder)
                                            <tr class="text-center">
                                                <td>
                                                    {{ $i + $ItemOrders->perPage() * ($ItemOrders->currentPage() - 1) }}
                                                </td>
                                                <td class="text-center">{{ $itemOrder->strItemMasterName }}</td>
                                                <td class="text-center">
                                                    {{ $itemOrder->strPreviousDays ?? '-' }}
                                                </td>
                                                <td class="text-center">
                                                    {{ $itemOrder->strMoring }}
                                                </td>
                                                <td class="text-center">
                                                    {{ $itemOrder->strAfternoon ?? '-' }}
                                                </td>
                                                <td class="text-center">
                                                    {{ $itemOrder->strEvening ?? '-' }}
                                                </td>

                                                <td class="text-center">
                                                    <a class="mx-1" title="Edit" data-bs-toggle="modal" title="Delete"
                                                        data-bs-target="#editRecordModal"
                                                        onclick="getData(<?= $itemOrder->iItemOrderId ?>);">
                                                        <i class="far fa-edit"></i>
                                                    </a>
                                                    <a class="mx-1" href="#" data-bs-toggle="modal" title="Delete"
                                                        data-bs-target="#deleteRecordModal"
                                                        onclick="deleteData(<?= $itemOrder->iItemOrderId ?>);">
                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <?php $i++; ?>
                                        @endforeach
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-center mt-3">
                                    {{ $ItemOrders->appends(request()->except('page'))->links() }}
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
                        <form id="user-delete-form" method="POST" action="{{ route('itemorder.delete') }}">
                            @csrf
                            @method('DELETE')
                            <input type="hidden" name="iItemOrderId" id="deleteid" value="">
                            <input type="hidden" name="page" id="currentPage" value="{{ request('page', 1) }}">
                            <input type="hidden" name="iCustomerId" id="iCustomerId" value="{{ $id }}">

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
                    <h5 class="modal-title" id="exampleModalLongTitle">Add Item Order</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        id="btn-close"></button>
                </div>
                <form id="user-delete-form" method="POST" action="{{ route('itemorder.store') }}">
                    <input type="hidden" name="iCustomerId" id="iCustomerId" value="{{ $id }}">
                    <div class="modal-body">
                        <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                            @csrf
                            <div class="row gy-4">
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Item Name
                                        <select class="form-control" name="iItemMasterId">
                                            <option value="">Select Item Master</option>
                                            @foreach ($ItemMasters as $ItemMaster)
                                                <option value=" {{ $ItemMaster->iItemMasterId }}">
                                                    {{ $ItemMaster->strItemMasterName }}</option>
                                            @endforeach
                                        </select>
                                        @error('iItemMasterId')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;"></span>Previous Days
                                        <input type="text" class="form-control" placeholder="Enter Previous Days"
                                            name="strPreviousDays" autocomplete="off" maxlength="30"
                                            value="{{ old('strPreviousDays') }}">
                                        @error('strPreviousDays')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;"></span>Morning
                                        <input type="text" class="form-control" placeholder="Enter Morning"
                                            maxlength="30" name="strMoring" autocomplete="off"
                                            value="{{ old('strMoring') }}">
                                        @error('strMoring')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div>
                                        <span style="color:red;"></span>Afternoon
                                        <input type="text" class="form-control" placeholder="Enter Afternoon"
                                            maxlength="30" name="strAfternoon" autocomplete="off"
                                            value="{{ old('strAfternoon') }}">
                                        @error('strAfternoon')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <span style="color:red;"></span>Evening
                                    <input type="text" class="form-control" placeholder="Enter Evening"
                                        maxlength="30" name="strEvening" autocomplete="off"
                                        value="{{ old('strEvening') }}">
                                    @error('strEvening')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-success">Submit</button>
                                    <a class="btn btn-primary float-right mr-3"
                                        href="{{ route('itemorder.index', $id) }}">Clear</a>
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
                    <h5 class="modal-title" id="exampleModalLongTitle">Edit Item Order</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        id="btn-close"></button>
                </div>
                <form id="user-delete-form" method="POST" action="{{ route('itemorder.update') }}">
                    <div class="modal-body">
                        <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                            @csrf
                            <input type="hidden" name="iItemOrderId" id="iItemOrderId" value="">
                            <input type="hidden" name="iCustomerId" id="iCustomerId" value="{{ $id }}">
                            <input type="hidden" name="page" id="currentPage" value="{{ request('page', 1) }}">
                            
                            <div class="row gy-4">
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Item Name
                                        <select class="form-control" name="iItemMasterId" id="EditiItemMasterId">
                                            <option value="">Select Item Master</option>
                                            @foreach ($ItemMasters as $ItemMaster)
                                                <option value="{{ $ItemMaster->iItemMasterId }}">
                                                    {{ $ItemMaster->strItemMasterName }}</option>
                                            @endforeach
                                        </select>
                                        @error('iItemMasterId')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;"></span>Previous Days
                                        <input type="text" class="form-control" placeholder="Enter Previous Days"
                                            maxlength="30" name="strPreviousDays" id="EditstrPreviousDays"
                                            autocomplete="off" value="{{ old('strPreviousDays') }}">
                                        @error('strPreviousDays')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;"></span>Morning
                                        <input type="text" class="form-control" placeholder="Enter Morning"
                                            maxlength="30" name="strMoring" id="EditstrMoring" autocomplete="off"
                                            value="{{ old('strMoring') }}">
                                        @error('strMoring')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div>
                                        <span style="color:red;"></span>Afternoon
                                        <input type="text" class="form-control" placeholder="Enter Afternoon"
                                            maxlength="30" name="strAfternoon" id="EditstrAfternoon" autocomplete="off"
                                            value="{{ old('strAfternoon') }}">
                                        @error('strAfternoon')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <span style="color:red;"></span>Evening
                                    <input type="text" class="form-control" placeholder="Enter Evening"
                                        maxlength="30" name="strEvening" id="EditstrEvening" autocomplete="off"
                                        value="{{ old('strEvening') }}">
                                    @error('strEvening')
                                        <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">Update</button>
                        <a class="btn btn-primary float-right mr-3"
                                        href="{{ route('itemorder.index', $id) }}">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--End Delete Modal -->

@endsection

@section('scripts')


    <script>
        function deleteData(id) {
            $("#deleteid").val(id);
        }

        function getData(id) {
            var url = "{{ route('itemorder.edit', ':id') }}";
            url = url.replace(":id", id);
            $.ajax({
                type: 'GET',
                url: url,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function(response) {
                    var obj = JSON.parse(response);

                    $("#EditiItemMasterId").val(obj.iItemMasterId);
                    $("#EditstrPreviousDays").val(obj.strPreviousDays);
                    $("#EditstrMoring").val(obj.strMoring);
                    $("#EditstrAfternoon").val(obj.strAfternoon);
                    $("#EditstrEvening").val(obj.strEvening);
                    $("#iItemOrderId").val(id);
                }
            });
        }
    </script>


    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


@endsection
