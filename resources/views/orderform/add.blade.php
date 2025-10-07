@extends('layouts.app')

@section('title', 'Order Form Add')

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
                        <h4 class="mb-sm-0">Add Order Form</h4>
                        <a href="{{ route('orderform.index', $id) }}"
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
                            <form action="{{ route('orderform.store') }}" method="POST"
                                enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="iCustomerId" value="{{ $id }}" />
                                <br>
                                <div class="accordion" id="accordionExample">
                                    @if (!empty($itemCategories))
                                    <?php $iCounter = 0; ?>
                                    @foreach($itemCategories as $category)
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="heading{{ $category['iItemSubCategoryId'] }}">
                                            <button
                                                class="accordion-button @if ($iCounter != 0) collapsed @endif"
                                                type="button"
                                                data-bs-toggle="collapse"
                                                data-bs-target="#collapse{{ $category['iItemSubCategoryId'] }}"
                                                aria-expanded="@if ($iCounter == 0) true @else false @endif"
                                                aria-controls="collapse{{ $category['iItemSubCategoryId'] }}">
                                                {{ $category['strItemSubCategoryName'] }}
                                            </button>
                                        </h2>

                                        <div id="collapse{{ $category['iItemSubCategoryId'] }}"
                                            class="accordion-collapse collapse @if ($iCounter == 0) show @endif"
                                            aria-labelledby="heading{{ $category['iItemSubCategoryId'] }}"
                                            data-bs-parent="#accordionExample">
                                            <div class="accordion-body">
                                                <div class="row">
                                                    @if(!empty($category['items']))
                                                    @foreach ($category['items'] as $item)

                                                    <div class="col-lg-12">

                                                        <input type="hidden" name="iItemCategoryId_{{ $item['iItemMasterId'] }}"
                                                            value="{{ $category['iItemCategoryId'] }}" />
                                                        <input type="hidden" name="iItemSubCategoryId_{{ $item['iItemMasterId'] }}"
                                                            value="{{ $category['iItemSubCategoryId'] }}" />
                                                        <?php
                                                        $orderDetails = "";
                                                        if (isset($OrderMaster->iOrderFormMasterId)) {
                                                            $orderDetails = \App\Models\OrderDetails::where(["iStatus" => 1, "isDelete" => 0, "iOrderFormMasterId" => $OrderMaster->iOrderFormMasterId, "iItemMasterId" => $item['iItemMasterId']])->first();
                                                        }
                                                        ?>

                                                        @if($category['iItemSubCategoryId'] == 1 || $category['iItemSubCategoryId'] == 4)
                                                        <div class="row gy-4">

                                                            <div class="col-lg-4 col-md-4">
                                                                <div>
                                                                    <!-- <span style="color:red;">*</span> -->
                                                                    Item Name
                                                                    <input type="hidden" value="{{ $item['iItemMasterId'] }}"
                                                                        name="iItemMasterId[]" />
                                                                    <input type="text" class="form-control" maxlength="50" readonly disabled autocomplete="off"
                                                                        value="{{ $item['strItemMasterName'] }}">
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-4 col-md-4">
                                                                <div>
                                                                    Kg
                                                                    <input type="text" class="form-control" maxlength="4" minlength="1"
                                                                        oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                                                        placeholder="Enter Kg" name="strKG_{{ $item['iItemMasterId'] }}"
                                                                        autocomplete="off" value="{{ $orderDetails->strKG ?? '' }}">
                                                                    @error('strKG')
                                                                    <span class="text-danger">{{ $message }}</span>
                                                                    @enderror
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-4">
                                                                <div>
                                                                    Gm
                                                                    <input type="text" class="form-control" maxlength="5" minlength="1"
                                                                        oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                                                        placeholder="Enter Gm" name="strGram_{{ $item['iItemMasterId'] }}"
                                                                        autocomplete="off" value="{{ $orderDetails->strGram ?? '' }}">
                                                                    @error('strGram')
                                                                    <span class="text-danger">{{ $message }}</span>
                                                                    @enderror
                                                                </div>
                                                            </div>
                                                        </div>
                                                        @else
                                                        <div class="row gy-4">

                                                            <div class="col-lg-6 col-md-6">
                                                                <div>
                                                                    <!-- <span style="color:red;">*</span> -->
                                                                    Item Name
                                                                    <input type="hidden" value="{{ $item['iItemMasterId'] }}"
                                                                        name="iItemMasterId[]" />
                                                                    <input type="text" class="form-control" maxlength="50" readonly disabled autocomplete="off"
                                                                        value="{{ $item['strItemMasterName'] }}">
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-6 col-md-6">
                                                                <div>
                                                                    Qty
                                                                    <input type="text" class="form-control" maxlength="10" minlength="1"
                                                                        oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                                                        placeholder="Enter Qty" name="strCount_{{ $item['iItemMasterId'] }}"
                                                                        autocomplete="off" value="{{ $orderDetails->strCount ?? '' }}">
                                                                    @error('strCount')
                                                                    <span class="text-danger">{{ $message }}</span>
                                                                    @enderror
                                                                </div>
                                                            </div>
                                                        </div>
                                                        @endif


                                                    </div>
                                                    @endforeach
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <?php $iCounter++; ?>
                                    @endforeach
                                    @endif
                                </div>


                                <div class="card-footer mt-5" style="float: right;">
                                    <button type="submit" class="btn btn-success">Submit</button>
                                    <a class="btn btn-primary float-right mr-3"
                                        href="{{ route('customer.index') }}">Clear</a>
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