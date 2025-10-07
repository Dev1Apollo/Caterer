@extends('layouts.app')

@section('title', 'Edit Product')

@section('content')

<!--<script src="https://cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>-->

<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">

            {{-- Alert Messages --}}
            @include('common.alert')

            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0">Edit Product</h4>
                        <div class="page-title-right">
                            <a href="{{ route('product.index') }}"
                                class="d-none d-sm-inline-block btn btn-sm btn btn-success shadow-sm">
                                <i class="fas fa-arrow-left fa-sm text-white-50"></i> Back
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="live-preview">
                                <form method="POST" onsubmit="return validateFile()"
                                    action="{{ route('product.update', $data->productId) }}"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="row gy-4">


                                        <div class="col-lg-4 col-md-6">
                                            <div>
                                                <span style="color:red;">*</span>Category Name
                                                <select class="form-control" name="categoryId" id="categoryId" required autofocus>
                                                    <option selected value="">Select Category Name
                                                    </option>
                                                    @foreach ($Category as $category)
                                                    <option value="{{ $category->categoryId }}"
                                                        {{ $data->categoryId == $category->categoryId ? 'selected' : '' }}>
                                                        {{ $category->categoryname }}
                                                    </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div>
                                                <!-- <span style="color:red;">*</span> -->
                                                Sub Category Name
                                                <select class="form-control" name="sub_categoryId" id="sub_categoryId" autofocus>
                                                    <option selected value="">Select Sub Category Name
                                                    </option>
                                                    @foreach ($SubCategory as $subCategory)
                                                    <option value="{{ $subCategory->sub_categoryId }}"
                                                        {{ isset($data->iSubCategoryId) && $data->iSubCategoryId == $subCategory->sub_categoryId ? 'selected' : '' }}>
                                                        {{ $subCategory->subcategoryname }}
                                                    </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div>
                                                <span style="color:red;">*</span>Product Name
                                                <input type="text" class="form-control" maxlength="30"
                                                    placeholder="Enter Product Name" name="productname"
                                                    autocomplete="off" value="{{ $data->productname }}" required>
                                                @error('productname')
                                                <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6">
                                            <div>
                                                <span style="color:red;">*</span>Sequence No
                                                <input type="text" class="form-control" maxlength="3" minlength="1"
                                                    onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
                                                    placeholder="Enter Sequence No" name="strSequenceNo"
                                                    autocomplete="off" value="{{ $data->strSequenceNo }}" required>
                                                @error('strSequenceNo')
                                                <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>





                                        <?php
                                        $ProductImages = \App\Models\ProductPhotos::select('productphotosid', 'strphoto')
                                            ->where(['productphotos.iStatus' => 1, 'productphotos.isDelete' => 0, 'productid' => $data->productId])
                                            ->get();
                                        $count = $ProductImages->count();
                                        $arr = [];
                                        foreach ($ProductImages as $value) {
                                            $arr[] = $value->strphoto;
                                        }
                                        ?>


                                        <!-- <div class="col-lg-4 col-md-6">
                                            <div>
                                                <span style="color:red;">*</span>Photo
                                                @if ($count == 0)
                                                <input type="file" name="photo[]" multiple class="form-control"
                                                    id="Editphoto" onKeyPress="if(this.value.length==0) return false;" required>
                                                <label id="photo-error" class="error" for="photo">This
                                                    field is required.</label>
                                                @else
                                                <input type="file" name="photo[]" multiple class="form-control"
                                                    id="Editphoto">
                                                @endif

                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6">
                                            <div>
                                                <div class="d-flex justify-content-between mt-3 mb-3">
                                                    @foreach ($ProductImages as $ProductImage)
                                                    <?php if (in_array($ProductImage->strphoto, $arr)) { ?>
                                                        <div id="PHOTOID_<?= $ProductImage->productphotosid ?>">
                                                            <img src="/Product/Thumbnail/{{ $ProductImage->strphoto }}"
                                                                width="50px" height="50px">

                                                            <button type="button"
                                                                onclick="imagedelete(<?= $ProductImage->productphotosid ?>);"
                                                                class="btn btn-link p-0">
                                                                <span class="text-500 fas fa-trash-alt"></span>
                                                            </button>

                                                        </div> &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <?php } ?>
                                                    @endforeach
                                                </div>
                                            </div>
                                        </div> -->

                                        <div class="col-lg-4 col-md-6">
                                            <div>

                                            </div>
                                        </div>



                                        <!-- <div class="col-lg-4 col-md-6">
                                                <div class="mt-4">
                                                    <input type="checkbox" name="ShowHomePage" id="ShowHomePage"
                                                        {{ $data->ShowHomePage == 1 ? 'checked' : null }}>
                                                    Show On Home Page &nbsp; &nbsp;
                                                    
                                                    <input type="checkbox" name="showOnFooter" id="showOnFooter"
                                                        {{ $data->showOnFooter == 1 ? 'checked' : null }}>
                                                    Show On Footer
                                                </div>
                                            </div> -->



                                        <!-- <div class="col-lg-12 col-md-6">
                                                Description</label>
                                                <textarea class="form-control ckeditor" name="description" id="description" rows="6">{{ $data->description }}</textarea>
                                                @error('description')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div> -->


                                    </div>
                                    <div class="card-footer mt-5" style="float: right;">
                                        <input type="submit"
                                            class="btn btn-success btn-user float-right mb-3" value="Save">
                                        <a class="btn btn-success float-right mr-3 mb-3"
                                            href="{{ route('product.index') }}">Cancel</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


@endsection

@section('scripts')

<script type="text/javascript" src="//js.nicedit.com/nicEdit-latest.js"></script>
<script type="text/javascript">
    bkLib.onDomLoaded(function() {
        nicEditors.allTextAreas()
    });
</script>

<script>
    $(document).ready(function() {
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
                    // if (response.length > 0) {
                    // $("#sub_categoryId").attr("required", "true");
                    $("#sub_categoryId").html(response);
                    // } else {
                    // $("#iLevel2CallAttendentIdDiv").css("display", "none");
                    // }
                }
            });
        });
    });


    $(document).ready(function() {
        $('#Editphoto').change(function() {
            var files = $('#Editphoto')[0].files;
            var numFiles = files.length;
            //alert(numFiles);
            if (numFiles > 0) {
                $("#photo-error").hide();
            }
            //$('#fileLengthInfo').text("Number of files selected: " + numFiles);
        });
    });

    function validateFile() {
        var allowedExtension = ['jpeg', 'jpg', 'png', 'webp'];
        var fileExtension = document.getElementById('strPhoto').value.split('.').pop().toLowerCase();

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
    function imagedelete(id) {
        var url = "{{ route('product.imagedelete', ':id') }}";
        url = url.replace(":id", id);
        if (id) {
            $.ajax({
                url: url,
                type: 'POST',
                data: {
                    id: id,
                    "_token": "{{ csrf_token() }}",
                },
                success: function(data) {
                    console.log(data);
                    var obj = JSON.parse(data);
                    console.log(obj);
                    if (data == 0) {
                        $('#Editphoto').prop('required', true);
                        window.location.href = "";

                    } else {
                        $("#PHOTOID_" + id).remove(); // Remove the entire element

                    }

                }
            });
        }
    }
</script>

@endsection