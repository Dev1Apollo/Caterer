@extends('layouts.app')
@section('title', 'Product Specifications List')
@section('content')

    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">

                {{-- Alert Messages --}}
                @include('common.alert')

                {{--  <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">Add Product Specifications</h4>
                        </div>
                    </div>
                </div>  --}}

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">

                                    <div class="col-lg-5">

                                        <div class="d-flex justify-content-between card-header">
                                            <h5 class="card-title mb-0">Add Product Specifications </h5>
                                            <a href="{{ route('product.index') }}"
                                                    class="d-none d-sm-inline-block btn btn-sm btn btn-success shadow-sm">
                                                    <i class="fas fa-arrow-left fa-sm text-white-50"></i> Back
                                                </a>
                                        </div>

                                        <div class="live-preview">
                                            <form action="{{ route('productfeature.store') }}" method="post">
                                                @csrf
                                                
                                                <input type="hidden" name="iProductId" value="{{ $id }}">
                                                
                                                <div class="modal-body">
                                                    
                                                    <div class="mt-4 mb-3">
                                                        <div>
                                                            <span style="color:red;">*</span>Specifications Name
                                                            <input type="text" class="form-control" name="strLabel"
                                                                placeholder="Enter Label Name" maxlength="100" autocomplete="off"
                                                                required>
                                                        </div>
                                                        @error('strLabel')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                    
                                                    <div class="mt-4 mb-3">
                                                        <div>
                                                            <span style="color:red;">*</span>Specifications Value
                                                            <input type="text" class="form-control" name="strValue"
                                                                placeholder="Enter Label Value" maxlength="100" autocomplete="off"
                                                                required>
                                                        </div>
                                                        @error('strValue')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>

                                                </div>
                                                <div class="modal-footer">
                                                    <div class="hstack mt-2 gap-2 justify-content-end">
                                                        <button type="submit"
                                                            class="btn btn-success btn-user float-right mx-2">
                                                            Save
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="col-lg-1">
                                    </div>

                                    <div class="col-lg-5">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="card-title mb-0">Product Specifications For <span style="color:red;"> {{ $ProductName->productname }} </span> </h5>
                                                
                                            </div>
                                            <div class="card-body">
                                                <?php //echo date('ymd');
                                                ?>
                                                <table id="scroll-horizontal" class="table nowrap align-middle"
                                                    style="width:100%">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">sr.no</th>
                                                            <th scope="col"> Specifications Name</th>
                                                            <th scope="col"> Specifications Value</th>
                                                            <th scope="col">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <?php $i = 1; ?>
                                                        @foreach ($Product as $category)
                                                            <tr class="text-center">
                                                                <td>{{ $i + $Product->perPage() * ($Product->currentPage() - 1) }}
                                                                <td>{{ $category->strLabel }}</td>
                                                                <td>{{ $category->strValue }}</td>
                                                                <td>
                                                                    <div class="d-flex gap-2">
                                                                        <a class="mx-1" title="Edit" href="#"
                                                                            onclick="getEditData(<?= $category->product_featuresId ?>)"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#showModal">
                                                                            <i class="far fa-edit"></i>
                                                                        </a>
                                                                        
                                                                        <a class="" href="#"
                                                                            data-bs-toggle="modal" title="Delete"
                                                                            data-bs-target="#deleteRecordModal"
                                                                            onclick="deleteData(<?= $category->product_featuresId ?>);">
                                                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                                                        </a>
                                                                        
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <?php $i++; ?>
                                                        @endforeach
                                                    </tbody>
                                                </table>
                                                <div class="d-flex justify-content-center mt-3">
                                                    {{ $Product->links() }}
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>




                </div>
            </div>
        </div>

        <!--Edit Modal Start-->
        <div class="modal fade flip" id="showModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-light p-3">
                        <h5 class="modal-title" id="exampleModalLabel">Edit Product Features</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                            id="close-modal"></button>
                    </div>
                    <form method="POST" onsubmit="return EditvalidateFile()" action="{{ route('productfeature.update') }}"
                        autocomplete="off" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="product_featuresId" id="product_featuresId" value="">

                        <div class="modal-body">

                            <div class="mb-3">
                                <span style="color:red;">*</span>Label Name
                                <input type="text" class="form-control" name="strLabel" id="EditstrLabel"
                                    placeholder="Enter Label Name" maxlength="100" autocomplete="off" required>
                                @error('strLabel')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <span style="color:red;">*</span>Label Value
                                <input type="text" class="form-control" name="strValue" id="EditstrValue"
                                    placeholder="Enter Label Value" maxlength="100" autocomplete="off" required>
                                @error('strValue')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>

                        </div>
                        <div class="modal-footer">
                            <div class="hstack gap-2 justify-content-end">
                                <button type="submit" class="btn btn-success" id="add-btn">Update</button>
                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--Edit Modal End -->

        <!--Delete Modal Start -->
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
                                colors="primary:#f7b84b,secondary:#f06548" style="width:100px;height:100px">
                            </lord-icon>
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
                            <form id="user-delete-form" method="POST" action="{{ route('productfeature.delete') }}">
                                @csrf
                                @method('DELETE')
                                <input type="hidden" name="product_featuresId" id="deleteid" value="">

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Delete modal End -->
    @endsection

    @section('scripts')
    
         <script>
            function deleteData(id) {
                $("#deleteid").val(id);
            }
        </script>

        <script>
            function getEditData(id) {
                //alert(id);
                var url = "{{ route('productfeature.edit', ':id') }}";
                url = url.replace(":id", id);
                if (id) {
                    $.ajax({
                        url: url,
                        type: 'GET',
                        data: {
                            id,
                            id
                        },
                        success: function(data) {
                            //console.log(data);
                            var obj = JSON.parse(data);
                            $("#EditstrLabel").val(obj.strLabel);
                            $("#EditstrValue").val(obj.strValue);
                            $('#product_featuresId').val(id);
                        }
                    });
                }
            }
        </script>

    @endsection
