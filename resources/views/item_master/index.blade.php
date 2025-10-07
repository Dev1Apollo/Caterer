@extends('layouts.app')

@section('title', 'Item List')

@section('content')
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">

                @if ($errors->any())
                    @foreach ($errors->all() as $error)
                        <li style="color:red">{{ $error }}</li>
                    @endforeach
                @endif
                {{-- Alert Messages --}}
                @include('common.alert')

                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0"> Item List </h4>
                            <a href="#" data-bs-toggle="modal" title="Add" data-bs-target="#addRecordModal"
                                class="btn btn-sm btn-success">
                                <i data-feather="plus"></i> Add New
                            </a>
                            {{--  <a href="{{ route('itemmaster.create') }}" class="btn btn-sm btn-success">
                                <i data-feather="plus"></i> Add New
                            </a>  --}}
                        </div>
                    </div>
                </div>

                <div class="col-lg-12">
                    <!-- Page Heading -->
                    <div class="card">
                        <div class="card-body">
                            <form method="post" id="form" action="{{ route('itemmaster.index') }}">
                                @csrf
                                <div class="row  align-items-center">
                                    <div class="col-md-3  mb-2">
                                        <div class="d-flex align-items-center">
                                            <select class="form-control" name="iItemCategoryId" id="SearchiItemCategoryId"
                                                autofocus>
                                                <option selected value="">Select Category Name
                                                </option>
                                                @foreach ($ItemCategory as $category)
                                                    <option value="{{ $category->iItemCategoryId }}"
                                                        {{ $iItemCategoryId == $category->iItemCategoryId ? 'selected' : '' }}>
                                                        {{ $category->strItemCategoryName }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3  mb-2">
                                        <div class="d-flex align-items-center">
                                            <select class="form-control" name="iItemSubCategoryId"
                                                id="SearchiItemSubCategoryId" autofocus>
                                                <option selected value="">Select Sub Category Name
                                                </option>
                                                @foreach ($ItemSubCategory as $subcategory)
                                                    <option value="{{ $subcategory->iItemSubCategoryId }}"
                                                        {{ $iItemSubCategoryId == $subcategory->iItemSubCategoryId ? 'selected' : '' }}>
                                                        {{ $subcategory->strItemSubCategoryName }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3  mb-2">
                                        <div class="d-flex align-items-center">
                                            <input placeholder="Enter Item Name" type="text" class="form-control"
                                                name="strItemMasterName" autocomplete="off" maxlength="30"
                                                value="<?= isset($strItemMasterName) ? $strItemMasterName : '' ?>">
                                        </div>
                                    </div>
                                    <div class="col-md-3 mb-2">
                                        <div class="input-group d-flex justify-content-right">
                                            <button type="submit" class="btn btn-success mx-3">
                                                Search
                                            </button>
                                            <a href="{{ route('itemmaster.index') }}" class="btn btn-success mx-2">
                                                Cancel
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </form>
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
                                            <th scope="col">sr.no</th>
                                            <th scope="col">Item Name</th>
                                            <th scope="col">Category Name</th>
                                            <th scope="col">Sub Category Name</th>
                                            <th scope="col">Sequence No</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $i = 1; ?>
                                        @foreach ($ItemMasters as $ItemMaster)
                                            <tr class="text-center">
                                                <td>
                                                    {{ $i + $ItemMasters->perPage() * ($ItemMasters->currentPage() - 1) }}
                                                </td>
                                                <td class="text-center">{{ $ItemMaster->strItemMasterName }}</td>
                                                <td class="text-center">{{ $ItemMaster->strItemCategoryName ?? '-' }}</td>
                                                <td class="text-center">{{ $ItemMaster->SubCategoryName ?? '-' }}
                                                </td>
                                                <td class="text-center">{{ $ItemMaster->iSequenceNo }}</td>

                                                <td class="text-center">
                                                    <a class="mx-1" title="Edit" data-bs-toggle="modal"
                                                        data-bs-target="#editRecordModal"
                                                        onclick="getData(<?= $ItemMaster->iItemMasterId ?>);">
                                                        <i class="far fa-edit"></i>
                                                    </a>

                                                    <a class="mx-1" href="#" data-bs-toggle="modal" title="Delete"
                                                        data-bs-target="#deleteRecordModal"
                                                        onclick="deleteData(<?= $ItemMaster->iItemMasterId ?>);">
                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <?php $i++; ?>
                                        @endforeach
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-center mt-3">
                                    {{ $ItemMasters->appends(request()->except('page'))->links() }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <!--Add Modal -->
    <div class="modal fade zoomIn" id="addRecordModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Add Item </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        id="btn-close"></button>
                </div>
                <form id="myForm" method="POST" action="{{ route('itemmaster.store') }}">
                    @csrf
                    <div class="modal-body">
                        <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                            @csrf
                            <div class="row gy-4">
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Category Name
                                        <select class="form-control" name="iItemCategoryId" id="iItemCategoryId" required
                                            autofocus>
                                            <option selected value="">Select Category Name
                                            </option>
                                            @foreach ($ItemCategory as $category)
                                                <option value="{{ $category->iItemCategoryId }}"
                                                    {{ old('iItemCategoryId') == $category->iItemCategoryId ? 'selected' : '' }}>
                                                    {{ $category->strItemCategoryName }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;"></span>Sub Category Name
                                        <select class="form-control" name="iItemSubCategoryId" id="iItemSubCategoryId"
                                            autofocus>
                                            <option selected value="">Select Sub Category Name
                                            </option>
                                            @foreach ($ItemSubCategory as $subCategory)
                                                <option value="{{ $subCategory->iItemSubCategoryId }}"
                                                    {{ old('iItemSubCategoryId') == $subCategory->iItemSubCategoryId ? 'selected' : '' }}>
                                                    {{ $subCategory->strItemSubCategoryName }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Item Name
                                        <input type="text" class="form-control" maxlength="30"
                                            placeholder="Enter Item Name" name="strItemMasterName" autocomplete="off"
                                            value="{{ old('strItemMasterName') }}" required>
                                        @error('strItemMasterName')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Sequence No
                                        <input type="text" class="form-control" maxlength="3" minlength="1"
                                            oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                            placeholder="Enter Sequence No" name="strSequenceNo" autocomplete="off"
                                            value="{{ old('strSequenceNo') }}" required>
                                        @error('strSequenceNo')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">Submit</button>
                        <a class="btn btn-primary float-right mr-3"
                                            href="{{ route('itemmaster.index') }}">Clear</a>                        
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--End Add Modal -->

    <!--Edit Modal -->
    <div class="modal fade zoomIn" id="editRecordModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Edit Item </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        id="btn-close"></button>
                </div>
                <form id="myForm" method="POST" action="{{ route('itemmaster.update') }}">
                    @csrf
                    <input type="hidden" name="iItemMasterId" id="iItemMasterId">
                    <input type="hidden" name="page" id="currentPage" value="{{ request('page', 1) }}">
                    
                    <div class="modal-body">
                        <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                            @csrf
                            <div class="row gy-4">
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Category Name
                                        <select class="form-control" name="iItemCategoryId" id="EditiItemCategoryId"
                                            required autofocus>
                                            <option selected value="">Select Category Name
                                            </option>
                                            @foreach ($ItemCategory as $category)
                                                <option value="{{ $category->iItemCategoryId }}"
                                                    {{ old('iItemCategoryId') == $category->iItemCategoryId ? 'selected' : '' }}>
                                                    {{ $category->strItemCategoryName }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;"></span>Sub Category Name
                                        <select class="form-control" name="iItemSubCategoryId"
                                            id="EditiItemSubCategoryId" autofocus>
                                            <option selected value="">Select Sub Category Name
                                            </option>
                                            @foreach ($ItemSubCategory as $subCategory)
                                                <option value="{{ $subCategory->iItemSubCategoryId }}"
                                                    {{ old('iItemSubCategoryId') == $subCategory->iItemSubCategoryId ? 'selected' : '' }}>
                                                    {{ $subCategory->strItemSubCategoryName }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Item Name
                                        <input type="text" class="form-control" maxlength="30"
                                            placeholder="Enter Item Name" name="strItemMasterName"
                                            id="EditstrItemMasterName" autocomplete="off"
                                            value="{{ old('strItemMasterName') }}" required>
                                        @error('strItemMasterName')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Sequence No
                                        <input type="text" class="form-control" maxlength="3" minlength="1"
                                            oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                            placeholder="Enter Sequence No" name="strSequenceNo" id="EditstrSequenceNo"
                                            autocomplete="off" value="{{ old('strSequenceNo') }}" required>
                                        @error('strSequenceNo')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">Update</button>
                        <a class="btn btn-primary float-right mr-3"
                                        href="{{ route('itemmaster.index') }}">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--End Edit Modal -->


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
                        <form id="user-delete-form" method="POST"
                            action="{{ route('itemmaster.delete', $ItemMaster->id ?? '') }}">
                            @csrf
                            @method('DELETE')
                            <input type="hidden" name="iItemMasterId" id="deleteid" value="">
                            <input type="hidden" name="page" id="currentPage" value="{{ request('page', 1) }}">

                        </form>
                    </div>
                </div>
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
            var url = "{{ route('itemmaster.edit', ':id') }}";
            url = url.replace(":id", id);
            $.ajax({
                type: 'GET',
                url: url,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function(response) {
                    var obj = JSON.parse(response);
                    $("#EditiItemCategoryId").change();
                    $("#EditiItemCategoryId").val(obj.iItemCategoryId);
                    $("#EditiItemSubCategoryId").val(obj.iItemSubCategoryId);
                    $("#EditstrItemMasterName").val(obj.strItemMasterName);
                    $("#EditstrSequenceNo").val(obj.iSequenceNo);
                    $("#iItemMasterId").val(id);
                }
            });
        }
    </script>

    <script>
        $("#iItemCategoryId").change(function() {

            var iItemCategoryId = $(this).val();
            var url = "{{ route('itemmaster.getsubcategory', ':id') }}";
            url = url.replace(":id", iItemCategoryId);
            $.ajax({
                type: 'GET',
                url: url,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function(response) {
                    // if (response.length > 0) {
                    // $("#sub_categoryId").attr("required", "true");
                    $("#iItemSubCategoryId").html(response);
                    // } else {
                    // $("#iLevel2CallAttendentIdDiv").css("display", "none");
                    // }
                }
            });
        });
        $("#EditiItemCategoryId").change(function() {

            var iItemCategoryId = $(this).val();
            var url = "{{ route('itemmaster.getsubcategory', ':id') }}";
            url = url.replace(":id", iItemCategoryId);
            $.ajax({
                type: 'GET',
                url: url,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function(response) {
                    // if (response.length > 0) {
                    // $("#sub_categoryId").attr("required", "true");
                    $("#EditiItemSubCategoryId").html(response);
                    // } else {
                    // $("#iLevel2CallAttendentIdDiv").css("display", "none");
                    // }
                }
            });
        });
        $("#SearchiItemCategoryId").change(function() {

            var iItemCategoryId = $(this).val();
            var url = "{{ route('itemmaster.getsubcategory', ':id') }}";
            url = url.replace(":id", iItemCategoryId);
            $.ajax({
                type: 'GET',
                url: url,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function(response) {
                    // if (response.length > 0) {
                    // $("#sub_categoryId").attr("required", "true");
                    $("#SearchiItemSubCategoryId").html(response);
                    // } else {
                    // $("#iLevel2CallAttendentIdDiv").css("display", "none");
                    // }
                }
            });
        });
    </script>

@endsection
