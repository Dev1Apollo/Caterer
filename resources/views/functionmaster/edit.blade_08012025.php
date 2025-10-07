@extends('layouts.app')

@section('title', 'Function Master List')

@section('content')
    <meta name="csrf-token" id="csrf-token" content="{{ csrf_token() }}">
    <style>
        ul {
            list-style-type: none;
        }

        .accordion-button {
            padding: 5px !important;
            background-color: #791103 !important;
            color: #fff !important;
            font-weight: bold;
        }

        .accordion-button:not(.collapsed)::after {
            color: #fff !important;
        }

        #accordionExample h3 {
            font-size: 16px;
            background-color: orangered;
            border-radius: 30px;
            padding: 5px !important;
            color: #fff;
            font-weight: bold;
            text-align: center;
        }

        #accordionExample input[type="checkbox" i] {
            margin-right: 10px !important;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

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
                            <h4 class="mb-sm-0">Add Function Details</h4>
                            <a href="{{ route('customerfunction.index', $FunctionMaster->iCustomerId) }}"
                                class="d-none d-sm-inline-block btn btn-sm btn btn-success shadow-sm">
                                <i class="fas fa-arrow-left fa-sm text-white-50"></i> Back
                            </a>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <form action="{{ route('customerfunction.update') }}" method="POST"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <input type="hidden" name="iFunctionId"
                                        value="{{ $FunctionMaster->iFunctionId ?? 0 }}" />
                                    <input type="hidden" name="iCustomerId" value="{{ $FunctionMaster->iCustomerId }}" />
                                    <div class="row gy-4">

                                        <div class="col-lg-3 col-md-4">
                                            <div>
                                                <span style="color:red;">*</span>Function Name
                                                <input type="text" class="form-control" maxlength="50"
                                                    placeholder="Enter Function Name " name="strFunction" autocomplete="off"
                                                    value="{{ $FunctionMaster->strFunction ?? '' }}" required>
                                                @error('strFunction')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-md-4">
                                            <div>
                                                <span style="color:red;">*</span>Date
                                                <input type="date" class="form-control" placeholder="Enter Date"
                                                    name="strDate" autocomplete="off"
                                                    value="{{ date('Y-m-d', strtotime($FunctionMaster->strDate)) ?? '' }}"
                                                    required>
                                                @error('strDate')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="col-lg-2 col-md-4">
                                            <div>
                                                <span style="color:red;">*</span>No Of Perosn
                                                <input type="text" class="form-control" maxlength="4" minlength="1"
                                                    oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                                    placeholder="Enter No Of Perosn" name="iNoOfPerosn" id="iNoOfPerosn"
                                                    autocomplete="off" value="{{ $FunctionMaster->iNoOfPerosn ?? '' }}"
                                                    required>
                                                @error('iNoOfPerosn')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="col-lg-2 col-md-4">
                                            <div>
                                                <span style="color:red;">*</span>Rate
                                                <input type="text" class="form-control" maxlength="5" minlength="1"
                                                    oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                                    placeholder="Enter Rate" name="iRatePerPerson" id="iRatePerPerson"
                                                    autocomplete="off" value="{{ $FunctionMaster->iRatePerPerson ?? '' }}"
                                                    required>
                                                @error('iRatePerPerson')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4">
                                            <div>
                                                <span style="color:red;">*</span>Total Amount
                                                <input type="text" readonly class="form-control" maxlength="5"
                                                    minlength="1"
                                                    onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
                                                    placeholder="Enter Total Amount" name="iTotalAmount" id="iTotalAmount"
                                                    autocomplete="off" value="{{ $FunctionMaster->iTotalAmount ?? '' }}"
                                                    required>
                                                @error('iTotalAmount')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                    </div><br>
                                    <?php $Categories = \App\Models\Category::where(["iStatus" => 1, "isDelete" => 0])->orderBy('strSequenceNo', 'asc')->get();
                                    $iCounter = 0;
                                    if (!$Categories->isEmpty()) {                                        
                                    $productIds = array_column($functionDetailArr, 'iProductId');
                                    ?>
                                    <div class="accordion" id="accordionExample">
                                        <?php 
                                        $iCounter = 0;
                                        foreach ($Categories as $category): 
                                        ?>
                                        <div class="accordion-item">
                                            <h2 class="accordion-header" id="heading{{ $category->categoryId }}">
                                                <button
                                                    class="accordion-button @if ($iCounter != 0) collapsed @endif"
                                                    type="button" data-bs-toggle="collapse"
                                                    data-bs-target="#collapse{{ $category->categoryId }}"
                                                    aria-expanded="@if ($iCounter == 0) true @else false @endif"
                                                    aria-controls="collapse{{ $category->categoryId }}">
                                                    {{ $category->categoryname }}
                                                </button>
                                            </h2>

                                            <div id="collapse{{ $category->categoryId }}"
                                                class="accordion-collapse collapse @if ($iCounter == 0) show @endif"
                                                aria-labelledby="heading{{ $category->categoryId }}"
                                                data-bs-parent="#accordionExample">
                                                <div class="accordion-body">
                                                    <div class="row">
                                                        <?php
                                                            $SubCategories = \App\Models\SubCategory::where(["iStatus" => 1, "isDelete" => 0, "categoryId" => $category->categoryId])->orderBy('strSequenceNo', 'asc')->get();

                                                            if ($SubCategories->isEmpty()) {
                                                                $Products = \App\Models\Product::where(["iStatus" => 1, "isDelete" => 0, "categoryId" => $category->categoryId])->orderBy('strSequenceNo', 'asc')->get();
                                                                if (!$Products->isEmpty()) {
                                                                    $iProductCounter = $Products->count();

                                                                    foreach ($Products as $Product) { ?>
                                                        <input type="hidden" name="categoryId_{{ $Product->productId }}"
                                                            value="{{ $category->categoryId }}" />
                                                        <input type="hidden"
                                                            name="iSubCategoryId_{{ $Product->productId }}"
                                                            value="0" />
                                                        <div class="col-lg-3">
                                                            <ul>
                                                                <li><input type="checkbox"
                                                                        value="{{ $Product->productId }}"
                                                                        {{ in_array($Product->productId, $productIds) ? 'checked' : '' }}
                                                                        name="product[]" />{{ $Product->productname }}
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <?php }
                                                                }
                                                            } else {
                                                                foreach ($SubCategories as $SubCategory) {
                                                                    $Products = \App\Models\Product::where(["iStatus" => 1, "isDelete" => 0, "categoryId" => $category->categoryId, "iSubCategoryId" => $SubCategory->sub_categoryId])->orderBy('strSequenceNo', 'asc')->get();
                                                                    if (!$Products->isEmpty()) {
                                                                        $iProductCounter = count($Products);
                                                                        //dd($iProductCounter);
                                                                    ?>
                                                        <div class="col-lg-3">
                                                            <h3>{{ $SubCategory->subcategoryname }}</h3>
                                                            <ul>
                                                                <?php foreach ($Products as $Product) { ?>
                                                                <input type="hidden"
                                                                    name="categoryId_{{ $Product->productId }}"
                                                                    value="{{ $category->categoryId }}" />
                                                                <input type="hidden"
                                                                    name="iSubCategoryId_{{ $Product->productId }}"
                                                                    value="{{ $SubCategory->sub_categoryId }}" />
                                                                <li><input type="checkbox"
                                                                        value="{{ $Product->productId }}"
                                                                        {{ in_array($Product->productId, $productIds) ? 'checked' : '' }}
                                                                        name="product[]" />{{ $Product->productname }}
                                                                </li>
                                                                <?php } ?>
                                                            </ul>
                                                        </div>
                                                        <?php }
                                                                }
                                                            }
                                                            ?>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <?php $iCounter++; ?>
                                        <?php endforeach; ?>
                                    </div>
                                    <?php } ?>
                                    <div class="card-footer mt-5" style="float: right;">
                                        <button type="submit"
                                            class="btn btn-success btn-user float-right mb-3">Update</button>
                                        <a class="btn btn-success float-right mr-3 mb-3"
                                            href="{{ route('customerfunction.index', $FunctionMaster->iCustomerId) }}">Cancel</a>
                                    </div>
                                </form>
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
                        <form id="user-delete-form" method="POST" action="{{ route('customer.delete') }}">
                            @csrf
                            @method('DELETE')
                            <input type="hidden" name="iCustomerId" id="deleteid" value="">

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End Delete Modal -->

@endsection

@section('scripts')
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $('#iNoOfPerosn').on('change', function() {
            let iNoOfPerosn = $(this).val();
            let iRatePerPerson = $("#iRatePerPerson").val();
            let iTotalAmount = 0;
            iTotalAmount = iNoOfPerosn * iRatePerPerson;
            if (/^\d*$/.test(iTotalAmount)) {
                $("#iTotalAmount").val(iTotalAmount);
            }

        });
        $('#iRatePerPerson').on('change', function() {
            let iNoOfPerosn = $("#iNoOfPerosn").val();
            let iRatePerPerson = $(this).val();
            let iTotalAmount = 0;
            iTotalAmount = iNoOfPerosn * iRatePerPerson;
            if (/^\d*$/.test(iTotalAmount)) {
                $("#iTotalAmount").val(iTotalAmount);
            }
        });
    </script>
@endsection
