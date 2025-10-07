@extends('layouts.app')

@section('title', 'Add Product')

@section('content')
<meta name="csrf-token" id="csrf-token" content="{{ csrf_token() }}">
    <!--<script src="https://cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>-->

    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">

                {{-- Alert Messages --}}
                @include('common.alert')

                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">Add Product</h4>
                            <div class="page-title-right">
                                <a href="{{ route('itemmaster.index') }}"
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
                                    <form method="POST" id="myForm" onsubmit="return validateFile()"
                                        action="{{ route('itemmaster.update') }}" enctype="multipart/form-data">
                                        @csrf
                                        <input type="hidden" name="iItemMasterId" id="iItemMasterId" value="{{ $ItemMaster->iItemMasterId }}"/>

                                        <div class="row gy-4">

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Category Name
                                                    <select class="form-control" name="iItemCategoryId" id="iItemCategoryId" required autofocus>
                                                        <option selected value="">Select Category Name
                                                        </option>
                                                        @foreach ($ItemCategory as $category)
                                                            <option value="{{ $category->iItemCategoryId }}"
                                                                {{ $ItemMaster->iItemCategoryId == $category->iItemCategoryId ? 'selected' : '' }}>
                                                                {{ $category->strItemCategoryName }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <!-- <span style="color:red;">*</span> -->
                                                    Sub Category Name
                                                    <select class="form-control" name="iItemSubCategoryId" id="iItemSubCategoryId" autofocus>
                                                        <option selected value="">Select Sub Category Name
                                                        </option>
                                                        @foreach ($ItemSubCategory as $subCategory)
                                                            <option value="{{ $subCategory->iItemSubCategoryId }}"
                                                                {{ $ItemMaster->iItemSubCategoryId == $subCategory->iItemSubCategoryId ? 'selected' : '' }}>
                                                                {{ $subCategory->strItemSubCategoryName }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Item Name
                                                    <input type="text" class="form-control" maxlength="30"
                                                        placeholder="Enter Item Name" name="strItemMasterName"
                                                        autocomplete="off" value="{{ $ItemMaster->strItemMasterName }}" required>
                                                    @error('strItemMasterName')
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
                                                        autocomplete="off" value="{{ $ItemMaster->iSequenceNo }}" required>
                                                    @error('strSequenceNo')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror    
                                                </div>
                                            </div>
            

                                            <div class="col-lg-4 col-md-6">
                                                <div>

                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>

                                                </div>
                                            </div>


                                        </div>
                                        <div class="card-footer mt-5" style="float: right;">
                                            <button type="submit"
                                                class="btn btn-success btn-user float-right mb-3">Save</button>
                                            <a class="btn btn-success float-right mr-3 mb-3"
                                                href="{{ route('itemmaster.index') }}">Cancel</a>
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

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>

    <script>
        $(document).ready(function() {
            $("#myForm").validate({
                rules: {
                    categoryId: {
                        required: true,
                    },
                    productname: {
                        required: true,
                    },
                    photo: {
                        required: true,
                    },
                    strElectricalData: {
                        required: true,
                    },
                    strHopperContainerCapacity: {
                        required: true,
                    },
                    strMotorSpeed: {
                        required: true,
                    },
                    strPowerConsumption: {
                        required: true,
                    },
                    strPowerRequirement: {
                        required: true,
                    },
                    strBodyMaterial: {
                        required: true,
                    },
                    strBodySize: {
                        required: true,
                    },
                    strNetWeight: {
                        required: true,
                    },
                },
                messages: {
                    categoryId: {
                        required: "Category is required",
                    },
                    productname: {
                        required: "Product is required",
                    },
                    photo: {
                        required: "Photo is required",
                    },
                    strElectricalData: {
                        required: "Electrical Data is required",
                    },
                    strHopperContainerCapacity: {
                        required: "Hopper/Container Capacity is required",
                    },
                    strMotorSpeed: {
                        required: "Motor Speed is required",
                    },
                    strPowerConsumption: {
                        required: "Power Consumption is required",
                    },
                    strPowerRequirement: {
                        required: "Power Requirement is required",
                    },
                    strBodyMaterial: {
                        required: "Body Material is required",
                    },
                    strBodySize: {
                        required: "Body Size is required",
                    },
                    strNetWeight: {
                        required: "Net Weight is required",
                    },
                }
            });
        });

        $("#iItemCategoryId").change(function(){
            
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
    </script>

@endsection
