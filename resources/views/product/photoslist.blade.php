@extends('layouts.app')

@section('title', 'Product Photos List')

@section('content')
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">

                {{-- Alert Messages --}}
                @include('common.alert')

                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">Product Photos List of <span style="color: red"> {{ $Product->productname }}
                                </span></h4>

                            <div class="page-title-right">
                                <a href="{{ route('product.index') }}"
                                    class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm">
                                    Back
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    @if ($count == 0)
                        <div class="col-md-12 col-sm-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="col-lg-12 col-md-12  col-xs-12 col-sm-12 padding-5 bottom-border-verydark">
                                        <div
                                            class="alert alert-info clearfix profile-information padding-all-10 margin-all-0 backgroundDark">
                                            <h1 class="font-white text-center"> No Data Found !
                                            </h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @else
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">

                                        <div class="col-lg-5">

                                            {{--  <div class="d-flex justify-content-between card-header">
                                                <h5 class="card-title mb-0">Add Photos </h5>
                                            </div>  --}}

                                            <div class="live-preview">
                                                <form action="{{ route('product.productphotosstore') }}" method="post"
                                                    onsubmit="return validateFile()" enctype="multipart/form-data">
                                                    @csrf

                                                    <input type="hidden" name="productId" value="{{ $id }}">
                                                    <div class="modal-body">

                                                        <div class="mt-4">
                                                            <div>
                                                                <span style="color:red;">*</span>Photo
                                                                <input type="file" class="form-control" name="strphoto"
                                                                    id="photovalidate" value="{{ old('strphoto') }}" required
                                                                    autocomplete="off">
                                                            </div>
                                                            @error('strphoto')
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
                                                <table id="scroll-horizontal" class="table nowrap align-middle"
                                                    style="width:100%">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">sr.No</th>
                                                            <th scope="col">Photo</th>
                                                            <th scope="col">Action</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <?php $i = 1; ?>
                                                        @foreach ($datas as $data)
                                                            <tr class="text-center">
                                                                <td width="1%">
                                                                    {{ $i + $datas->perPage() * ($datas->currentPage() - 1) }}
                                                                </td>
                                                                <td width="2%">
                                                                    <img src="{{ asset('Product/Thumbnail') . '/' . $data->strphoto }}"
                                                                        style="width: 50px;height: 50px;">
                                                                </td>


                                                                <td width="1%">


                                                                    <a class="mx-1" href="#" data-bs-toggle="modal"
                                                                        title="Delete" data-bs-target="#deleteRecordModal"
                                                                        onclick="deleteData(<?= $data->productphotosid ?>);">
                                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                                    </a>

                                                                </td>
                                                            </tr>
                                                            <?php $i++; ?>
                                                        @endforeach
                                                    </tbody>

                                                </table>
                                                <div class="d-flex justify-content-center mt-3">
                                                    {{ $datas->appends(request()->except('page'))->links() }}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endif
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
                        <a class="btn btn-danger mx-2" href="{{ route('logout') }}"
                            onclick="event.preventDefault(); document.getElementById('user-delete-form').submit();">
                            Yes,
                            Delete It!
                        </a>
                        <button type="button" class="btn w-sm btn-danger mx-2" data-bs-dismiss="modal">Close</button>
                        <form id="user-delete-form" method="POST"
                            action="{{ route('product.productphotosdelete') }}">
                            @csrf
                            @method('DELETE')
                            <input type="hidden" name="productphotosid" id="deleteid" value="">

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
        function editpassword(id) {
            $("#GetId").val(id);
        }

        function deleteData(id) {
            $("#deleteid").val(id);
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
@endsection
