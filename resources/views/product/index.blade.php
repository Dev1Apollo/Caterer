@extends('layouts.app')

@section('title', 'Product List')

@section('content')
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
                            <h4 class="mb-sm-0"> Product List</h4>
                            {{--  <a href="{{ route('product.create') }}" class="btn btn-sm btn-success">
                            <i data-feather="plus"></i> Add New
                        </a>  --}}
                            <a href="#" data-bs-toggle="modal" title="Add" data-bs-target="#addRecordModal"
                                class="btn btn-sm btn-success">
                                <i data-feather="plus"></i> Add New
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12">
                    <!-- Page Heading -->
                    <div class="card">
                        <div class="card-body">
                            <form method="post" id="form" action="{{ route('product.index') }}">
                                @csrf
                                <div class="row  align-items-center">
                                    <div class="col-md-3  mb-2">
                                        <div class="d-flex align-items-center">
                                            <select class="form-control" name="categoryId" autofocus>
                                                <option selected value="">Select Category Name
                                                </option>
                                                @foreach ($Category as $category)
                                                    <option value="{{ $category->categoryId }}"
                                                        {{ $CategoryId == $category->categoryId ? 'selected' : '' }}>
                                                        {{ $category->categoryname }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3  mb-2">
                                        <div class="d-flex align-items-center">
                                            <input placeholder="Enter Product Name" type="text" class="form-control"
                                                name="productName" autocomplete="off" maxlength="30"
                                                value="<?= isset($ProductName) ? $ProductName : '' ?>">
                                        </div>
                                    </div>
                                    <div class="col-md-3 mb-2">
                                        <div class="input-group d-flex justify-content-right">
                                            <button type="submit" class="btn btn-success mx-3">
                                                Search
                                            </button>
                                            <a href="{{ route('product.index') }}" class="btn btn-success mx-2">
                                                Reset
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
                                            <th scope="col">Product Name</th>
                                            <th scope="col">Category Name</th>
                                            <th scope="col">Sub Category Name</th>

                                            <th scope="col">Sequence No</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $i = 1; ?>
                                        @foreach ($Product as $product)
                                            <tr class="text-center">
                                                <td>
                                                    {{ $i + $Product->perPage() * ($Product->currentPage() - 1) }}
                                                </td>
                                                <td class="text-center">{{ $product->productname }}</td>
                                                <td class="text-center">{{ $product->categoryname }}</td>
                                                <td class="text-center">{{ $product->subcategoryname }}</td>

                                                <td class="text-center">{{ $product->strSequenceNo }}</td>

                                                <td class="text-center">

                                                    <a class="mx-1" title="Edit" data-bs-toggle="modal"
                                                        data-bs-target="#editRecordModal"
                                                        onclick="getData(<?= $product->productId ?>);">
                                                        <i class="far fa-edit"></i>
                                                    </a>
                                                    <a class="mx-1" href="#" data-bs-toggle="modal" title="Delete"
                                                        data-bs-target="#deleteRecordModal"
                                                        onclick="deleteData(<?= $product->productId ?>);">
                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <?php $i++; ?>
                                        @endforeach
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-center mt-3">
                                    {{ $Product->appends(request()->except('page'))->links() }}
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
                    <h5 class="modal-title" id="exampleModalLongTitle">Add Product </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        id="btn-close"></button>
                </div>
                <form id="myForm" method="POST" action="{{ route('product.store') }}">
                    @csrf
                    <div class="modal-body">
                        <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                            @csrf
                            <div class="row gy-4">
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Category Name
                                        <select class="form-control" name="categoryId" id="categoryId" required autofocus>
                                            <option selected value="">Select Category Name
                                            </option>
                                            @foreach ($Category as $category)
                                                <option value="{{ $category->categoryId }}"
                                                    {{ old('categoryId') == $category->categoryId ? 'selected' : '' }}>
                                                    {{ $category->categoryname }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;"></span>Sub Category Name
                                        <select class="form-control" name="sub_categoryId" id="sub_categoryId" autofocus>
                                            <option selected value="">Select Sub Category Name
                                            </option>
                                            @foreach ($SubCategory as $subCategory)
                                                <option value="{{ $subCategory->sub_categoryId }}"
                                                    {{ old('sub_categoryId') == $subCategory->sub_categoryId ? 'selected' : '' }}>
                                                    {{ $subCategory->subcategoryname }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Product Name
                                        <input type="text" class="form-control" maxlength="50"
                                            placeholder="Enter Product Name" name="productname" autocomplete="off"
                                            value="{{ old('productname') }}" required>
                                        @error('productname')
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
                                            href="{{ route('product.index') }}">Clear</a>                        
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
                    <h5 class="modal-title" id="exampleModalLongTitle">Edit Product </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        id="btn-close"></button>
                </div>
                <form id="myForm" method="POST" action="{{ route('product.update') }}">
                    @csrf
                    <input type="hidden" name="productId" id="productId">
                    <input type="hidden" name="page" id="currentPage" value="{{ request('page', 1) }}">
                    
                    <div class="modal-body">
                        <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                            @csrf
                            <div class="row gy-4">
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Category Name
                                        <select class="form-control" name="categoryId" id="EditcategoryId" required
                                            autofocus>
                                            <option selected value="">Select Category Name
                                            </option>
                                            @foreach ($Category as $category)
                                                <option value="{{ $category->categoryId }}"
                                                    {{ old('categoryId') == $category->categoryId ? 'selected' : '' }}>
                                                    {{ $category->categoryname }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;"></span>Sub Category Name
                                        <select class="form-control" name="sub_categoryId" id="Editsub_categoryId"
                                            autofocus>
                                            <option selected value="">Select Sub Category Name
                                            </option>
                                            @foreach ($SubCategory as $subCategory)
                                                <option value="{{ $subCategory->sub_categoryId }}"
                                                    {{ old('sub_categoryId') == $subCategory->sub_categoryId ? 'selected' : '' }}>
                                                    {{ $subCategory->subcategoryname }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Product Name
                                        <input type="text" class="form-control" maxlength="50"
                                            placeholder="Enter Product Name" name="productname" id="Editproductname"
                                            autocomplete="off" value="{{ old('productname') }}" required>
                                        @error('productname')
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
                                        href="{{ route('product.index') }}">Cancel</a>
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
                            action="{{ route('product.delete', $product->id ?? '') }}">
                            @csrf
                            @method('DELETE')
                            <input type="hidden" name="productId" id="deleteid" value="">
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
            var url = "{{ route('product.edit', ':id') }}";
            url = url.replace(":id", id);
            $.ajax({
                type: 'GET',
                url: url,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function(response) {
                    var obj = JSON.parse(response);

                    $("#EditcategoryId").val(obj.categoryId);
                    $("#Editsub_categoryId").val(obj.iSubCategoryId);
                    $("#Editproductname").val(obj.productname);
                    $("#EditstrSequenceNo").val(obj.strSequenceNo);
                    $("#productId").val(id);
                }
            });
        }
    </script>

    <script>
        $("#categoryId").change(function() {

            var categoryId = $(this).val();
            var url = "{{ route('product.getsubcategory', ':id') }}";
            url = url.replace(":id", categoryId);
            $.ajax({
                type: 'GET',
                url: url,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function(response) {
                    $("#sub_categoryId").html(response);
                }
            });
        });
        $("#EditcategoryId").change(function() {

            var categoryId = $(this).val();
            var url = "{{ route('product.getsubcategory', ':id') }}";
            url = url.replace(":id", categoryId);
            $.ajax({
                type: 'GET',
                url: url,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function(response) {
                    $("#Editsub_categoryId").html(response);
                }
            });
        });
    </script>


    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


@endsection
