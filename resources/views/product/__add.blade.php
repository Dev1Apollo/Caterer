@extends('layouts.app')

@section('title', 'Add Product')

@section('content')

    <script src="https://cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>

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
                                    <form method="POST" id="myForm" onsubmit="return validateFile()"
                                        action="{{ route('product.store') }}" enctype="multipart/form-data">
                                        @csrf
                                        <div class="row gy-4">

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Category Name
                                                    <select class="form-control" name="categoryId" required autofocus>
                                                        <option selected value="">Select Category Name
                                                        </option>
                                                        @foreach ($Category as $category)
                                                            <option value="{{ $category->categoryId }}"
                                                                {{ old('categoryId') == $category->categoryId ? 'selected' : '' }}>
                                                                {{ $category->categoryname }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Product Name
                                                    <input type="text" class="form-control" maxlength="30"
                                                        placeholder="Enter Product Name" name="productname"
                                                        autocomplete="off" value="{{ old('productname') }}" required>
                                                    @error('productname')
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
                                                    <span style="color:red;">*</span>Photo
                                                    <input type="file" class="form-control" name="photo[]" multiple
                                                        id="strPhoto" required>
                                                </div>
                                                <div id="viewimg">
                                                    @error('photo')
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


                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Electrical Data
                                                    <input type="text" class="form-control" name="strElectricalData"
                                                        maxlength="100" id="strElectricalData"
                                                        placeholder="Enter Electrical Data" required autocomplete="off"
                                                        value="{{ old('strElectricalData') }}">
                                                </div>
                                                @error('strElectricalData')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span> Hopper / Container Capacity
                                                    <input type="text" class="form-control"
                                                        name="strHopperContainerCapacity" id="strHopperContainerCapacity"
                                                        maxlength="100" placeholder="Enter  Hopper / Container Capacity"
                                                        required autocomplete="off"
                                                        value="{{ old('strHopperContainerCapacity') }}">
                                                </div>
                                                @error('strHopperContainerCapacity')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span> Motor Speed (RPM)
                                                    <input type="text" class="form-control" name="strMotorSpeed"
                                                        id="strMotorSpeed" placeholder="Enter  Motor Speed (RPM)	" required
                                                        autocomplete="off" maxlength="100"
                                                        value="{{ old('strMotorSpeed') }}">
                                                </div>
                                                @error('strMotorSpeed')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span> Power Consumption (W)
                                                    <input type="text" class="form-control" name="strPowerConsumption"
                                                        maxlength="100" id="strPowerConsumption"
                                                        placeholder="Enter  Power Consumption (W)" required
                                                        autocomplete="off" value="{{ old('strPowerConsumption') }}">
                                                </div>
                                                @error('strPowerConsumption')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span> Power Requirement (V)
                                                    <input type="text" class="form-control" name="strPowerRequirement"
                                                        maxlength="100" id="strPowerRequirement"
                                                        placeholder="Enter Power Requirement (V)" required
                                                        autocomplete="off" value="{{ old('strPowerRequirement') }}">
                                                </div>
                                                @error('strPowerRequirement')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span> Body Material
                                                    <input type="text" class="form-control" name="strBodyMaterial"
                                                        maxlength="100" id="strBodyMaterial"
                                                        placeholder="Enter Body Material" required autocomplete="off"
                                                        value="{{ old('strBodyMaterial') }}">
                                                </div>
                                                @error('strBodyMaterial')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>


                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span> Body Size
                                                    <input type="text" class="form-control" maxlength="100"
                                                        name="strBodySize" id="strBodySize" placeholder="Enter Body Size"
                                                        required autocomplete="off" value="{{ old('strBodySize') }}">
                                                </div>
                                                @error('strBodySize')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span> Net Weight (Kg)
                                                    <input type="text" class="form-control" name="strNetWeight"
                                                        id="strNetWeight" placeholder="Enter Net Weight (Kg)"
                                                        maxlength="30" required autocomplete="off"
                                                        value="{{ old('strNetWeight') }}">
                                                </div>
                                                @error('strNetWeight')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div class="mt-4">
                                                    <input type="checkbox" name="ShowHomePage" id="ShowHomePage">
                                                    Show On Home Page
                                                </div>
                                            </div>

                                            <div class="col-lg-12 col-md-6">
                                                <span style="color:red;">*</span>Description</label>
                                                <textarea class="form-control ckeditor" name="description" id="description" rows="6">{{ old('description') }}</textarea>
                                                @error('description')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>


                                        </div>
                                        <div class="card-footer mt-5" style="float: right;">
                                            <button type="submit"
                                                class="btn btn-success btn-user float-right mb-3">Save</button>
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

    <script>
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
        var editor = CKEDITOR.replace('description', {
            language: 'en',
            extraPlugins: 'notification'
        });

        editor.on('required', function(evt) {
            alert('Description is required.', 'warning');
            evt.cancel();
        });
    </script>

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
    </script>


    <script>
        var editor = CKEDITOR.replace('description', {
            language: 'en',
            extraPlugins: 'notification'
        });

        editor.on('required', function(evt) {
            alert('Description is required.', 'warning');
            evt.cancel();
        });
    </script>
@endsection
