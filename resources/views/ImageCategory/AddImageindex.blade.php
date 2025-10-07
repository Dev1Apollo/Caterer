@extends('layouts.app')
@section('title', 'Add Image List')
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
                                            <h5 class="card-title mb-0">Add Image </h5>
                                        </div>
                                        <div class="live-preview">
                                            <form action="{{ route('ImageCategory.Imagestore') }}" method="post"
                                                onsubmit="return validateFile()" enctype="multipart/form-data">
                                                @csrf
                                                <div class="modal-body">
                                                    <div class="mt-4 mb-3">
                                                        <div>
                                                            <span style="color:red;">*</span>Image Category Name
                                                            <select type="text" class="form-control" name="categoryId"
                                                                autocomplete="off" required>
                                                                <option value="">Select Image Category Name</option>
                                                                @foreach ($Category as $category)
                                                                    <option value="{{ $category->id }}">
                                                                        {{ $category->Imagecategoryname }}</option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                        @error('categoryId')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                    <div class="mt-4">
                                                        <div>
                                                            <span style="color:red;"></span>Photo
                                                            <input type="file" class="form-control" name="photo"
                                                                id="photovalidate" value="{{ old('photo') }}"
                                                                autocomplete="off">
                                                        </div>
                                                        @error('photo')
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
                                                        <a href="{{ route('ImageCategory.AddImageindex') }}"
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
                                                <h5 class="card-title mb-0">Image List</h5>
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
                                                            <th scope="col">Photo</th>
                                                            <th scope="col">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <?php $i = 1; ?>
                                                        @foreach ($image as $item)
                                                            <tr class="text-center">
                                                                <td>{{ $i + $image->perPage() * ($image->currentPage() - 1) }}
                                                                <td>{{ $item->Imagecategoryname }}</td>

                                                                <td>
                                                                    <?php if($item->photo){ ?>
                                                                    <a target="_blank"
                                                                        href="{{ asset('ImageCategory') . '/' . $item->photo }}">
                                                                        <img src="{{ asset('ImageCategory') . '/' . $item->photo }}"
                                                                            style="width: 50px;height: 50px;">
                                                                    </a>
                                                                    <?php }else{ ?>
                                                                    <a target="_blank"
                                                                        href="{{ asset('assets/images/noimage.png') }}">
                                                                        <img src="{{ asset('assets/images/noimage.png') }}"
                                                                            style="width: 50px;height: 50px;">
                                                                    </a>
                                                                    <?php } ?>
                                                                </td>
                                                                <td>
                                                                    <div class="">

                                                                        <a class="" href="#"
                                                                            data-bs-toggle="modal" title="Delete"
                                                                            data-bs-target="#deleteRecordModal"
                                                                            onclick="deleteData(<?= $item->id ?>);">
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
                                                    {{ $image->links() }}
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
                            <form id="user-delete-form" method="POST"
                                action="{{ route('ImageCategory.imagedelete') }}">
                                @csrf
                                @method('DELETE')
                                <input type="hidden" name="imageId" id="deleteid" value="">
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
                @if ($errors->has('Editcategoryname'))
                    $('#showModal').modal('show');
                @endif
            });
        </script>

        <script>
            function getEditData(id) {
                //alert(id);
                var url = "{{ route('subcategory.edit', ':id') }}";
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
                            $("#EditstrSequenceNo").val(obj.strSequenceNo);
                            $("#EditcategoryId").val(obj.categoryId)
                            $("#Editsubcategoryname").val(obj.subcategoryname);
                            $('#hiddenPhoto').val(obj.photo);
                            var html = "";
                            if (obj.photo == "" || obj.photo == null) {
                                html =
                                    '<img src = "/Caterer/assets/images/noimage.png" width = "50px" height = "50px" > ';
                            } else {
                                html =
                                    '<img src="/Caterer/SubCategory/' + obj.photo +
                                    '" id="hiddenPhoto" width="50px" height = "50px" > ';
                            }
                            $('#PHOTOID').html(html);
                            $('#sub_categoryId').val(id);
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

        {{-- Edit photo --}}
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
            $("#Editphoto").change(function() {
                html =
                    '<img src="' + readURL(this) +
                    '"   id="hello" width="70px" height = "70px" > ';
                $('#PHOTOID').html(html);
            });
        </script>

        <script>
            function deleteData(id) {
                $("#deleteid").val(id);
            }
        </script>
        <script>
            function validateFile() {
                var allowedExtension = ['jpeg', 'jpg', 'png', 'webp', ""];
                var fileExtension = document.getElementById('photovalidate').value.split('.').pop().toLowerCase();
                var isValidFile = false;

                for (var index in allowedExtension) {

                    if (fileExtension === allowedExtension[index]) {
                        isValidFile = true;
                        break;
                    }
                }

                if (!isValidFile) {
                    alert('Allowed Extensions are : *.' + allowedExtension.join(', *.'));
                }

                return isValidFile;
            }
        </script>

        <script>
            function EditvalidateFile() {
                //alert('hello');
                var allowedExtension = ['jpeg', 'jpg', 'png', 'webp', ""];
                var fileExtension = document.getElementById('Editphoto').value.split('.').pop().toLowerCase();
                var isValidFile = false;
                var image = document.getElementById('Editphoto').value;
                for (var index in allowedExtension) {
                    if (fileExtension === allowedExtension[index]) {
                        isValidFile = true;
                        break;
                    }
                }
                if (image != "") {
                    if (!isValidFile) {
                        alert('Allowed Extensions are : *.' + allowedExtension.join(', *.'));
                    }
                    return isValidFile;
                }
                return true;
            }
        </script>
    @endsection
