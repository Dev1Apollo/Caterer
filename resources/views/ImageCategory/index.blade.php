@extends('layouts.app')
@section('title', 'Image Category List')
@section('content')

    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">

                {{-- Alert Messages --}}
                @include('common.alert')

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-5">
                                        <div class="d-flex justify-content-between card-header">
                                            <h5 class="card-title mb-0">Add Image Category </h5>
                                        </div>
                                        <div class="live-preview">
                                            <form action="{{ route('ImageCategory.store') }}" method="post"
                                                onsubmit="return validateFile()" enctype="multipart/form-data">
                                                @csrf
                                                <div class="modal-body">

                                                    <div class="mt-4 mb-3">
                                                        <div>
                                                            <span style="color:red;">*</span>Image Category Name
                                                            <input type="text" class="form-control"
                                                                name="Imagecategoryname"
                                                                placeholder="Enter Image Category Name" maxlength="50"
                                                                autocomplete="off" required>
                                                        </div>
                                                        @error('Imagecategoryname')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                    <div class="col-lg-1 col-md-3">
                                                        <div id="viewimg">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <div class="hstack mt-2 gap-2 justify-content-end">
                                                        <button type="submit"
                                                            class="btn btn-success btn-user float-right mx-2">
                                                            Submit
                                                        </button>
                                                        <a href="{{ route('ImageCategory.index') }}"
                                                            class="btn btn-success btn-user float-right mx-2">
                                                            Clear
                                                        </a>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="col-lg-1">
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5 class="card-title mb-0">Image Category List</h5>
                                            </div>
                                            <div class="card-body">
                                                <?php //echo date('ymd');
                                                ?>
                                                <table id="scroll-horizontal" class="table nowrap align-middle"
                                                    style="width:100%">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">sr.no</th>
                                                            <th scope="col">Image Category Name</th>
                                                            <th scope="col">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <?php $i = 1; ?>
                                                        @foreach ($ImageCategory as $category)
                                                            <tr class="text-center">
                                                                <td>{{ $i + $ImageCategory->perPage() * ($ImageCategory->currentPage() - 1) }}
                                                                <td>{{ $category->Imagecategoryname }}</td>
                                                                <td>
                                                                    <div class="d-flex gap-2">
                                                                        <a class="mx-1" title="Edit" href="#"
                                                                            onclick="getEditData(<?= $category->id ?>)"
                                                                            data-bs-toggle="modal"
                                                                            data-bs-target="#showModal">
                                                                            <i class="far fa-edit"></i>
                                                                        </a>
                                                                        <a class="" href="#"
                                                                            data-bs-toggle="modal" title="Delete"
                                                                            data-bs-target="#deleteRecordModal"
                                                                            onclick="deleteData(<?= $category->id ?>);">
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
                                                    {{ $ImageCategory->links() }}
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
                        <h5 class="modal-title" id="exampleModalLabel">Edit Image Category</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                            id="close-modal"></button>
                    </div>
                    <form method="POST" action="{{ route('ImageCategory.update') }}" autocomplete="off"
                        enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="categoryId" id="categoryId" value="">
                        <input type="hidden" name="page" id="currentPage" value="{{ request('page', 1) }}">

                        <div class="modal-body">

                            <div class="mb-3">
                                <span style="color:red;">*</span>Image Category Name
                                <input type="text" class="form-control" name="EditImagecategoryname"
                                    id="EditImagecategoryname" placeholder="Enter Image Category Name" maxlength="50"
                                    autocomplete="off" required>
                                @error('EditImagecategoryname')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>

                        </div>
                        <div class="modal-footer">
                            <div class="hstack gap-2 justify-content-end">
                                <button type="submit" class="btn btn-success" id="add-btn">Update</button>
                                <a class="btn btn-primary float-right mr-3"
                                    href="{{ route('ImageCategory.index') }}">Cancel</a>
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
                            <form id="user-delete-form" method="POST" action="{{ route('ImageCategory.delete') }}">
                                @csrf
                                @method('DELETE')
                                <input type="hidden" name="categoryId" id="deleteid" value="">
                                <input type="hidden" name="page" id="currentPage" value="{{ request('page', 1) }}">
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
            // JavaScript to open edit modal if there are validation errors
            $(document).ready(function() {
                @if ($errors->has('EditImagecategoryname'))
                    $('#showModal').modal('show');
                @endif
            });
        </script>

        <script>
            function getEditData(id) {
                //alert(id);
                var url = "{{ route('ImageCategory.edit', ':id') }}";
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
                            $("#EditImagecategoryname").val(obj.Imagecategoryname);
                            $('#categoryId').val(id);
                        }
                    });
                }
            }
        </script>

        {{-- Add photo --}}
        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        $('#hello').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("#photovalidate").change(function() {
                html =
                    '<img src="' + readURL(this) +
                    '"   id="hello" width="70px" height = "70px" > ';
                $('#viewimg').html(html);
            });
        </script>
        <script>
            function deleteData(id) {
                $("#deleteid").val(id);
            }
        </script>
    @endsection
