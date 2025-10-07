@extends('layouts.app')

@section('title', 'Edit Customer')

@section('content')

    <meta name="csrf-token" id="csrf-token" content="{{ csrf_token() }}">
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
                            <h4 class="mb-sm-0">Edit Customer</h4>
                            {{--  <a href="#" data-bs-toggle="modal" title="Add" data-bs-target="#addRecordModal"
                                class="btn btn-sm btn-success">
                                <i data-feather="plus"></i> Add New
                            </a>  --}}
                            <div class="page-title-right">
                                <a href="{{ route('customer.index') }}"
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
                                        action="{{ route('customer.update', $data['iCustomerId']) }}"
                                        enctype="multipart/form-data">
                                        @csrf
                                        <div class="row gy-4">

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Customer Name
                                                    <input type="text" class="form-control" maxlength="50"
                                                        placeholder="Enter Customer Name" name="strCustomerName"
                                                        autocomplete="off" value="{{ $data['strCustomerName'] }}" required>
                                                    @error('strCustomerName')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Customer Address
                                                    <textarea type="text" class="form-control" placeholder="Enter Customer Address" name="strAddress" autocomplete="off"
                                                        required> {{ $data['strAddress'] }} </textarea>
                                                    @error('strAddress')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <!-- <span style="color:red;">*</span> -->Phone No. (Home)
                                                    <input type="text" class="form-control" maxlength="10" minlength="10"
                                                        oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                                        placeholder="Enter Phone No. (Home)" name="iMobileHouse"
                                                        autocomplete="off" value="{{ $data['iMobileHouse'] }}">
                                                    @error('iMobileHouse')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <!-- <span style="color:red;">*</span> -->
                                                    Phone No. (Office)
                                                    <input type="text" class="form-control" maxlength="10" minlength="10"
                                                        oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                                        placeholder="Enter Phone No. (Office)" name="iMobileOffice"
                                                        autocomplete="off" value="{{ $data['iMobileOffice'] }}">
                                                    @error('iMobileOffice')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Phone No. (Mobile)
                                                    <input type="text" class="form-control" maxlength="10" minlength="10"
                                                        oninput="this.value = this.value.replace(/[^0-9]/g, '');"
                                                        placeholder="Enter Phone No. (Mobile)" name="iMobileNo"
                                                        autocomplete="off" value="{{ $data['iMobileNo'] }}">
                                                    @error('iMobileNo')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Function Name
                                                    <input type="text" class="form-control" maxlength="50"
                                                        placeholder="Enter Function Name" name="strFunctionName"
                                                        autocomplete="off" value="{{ $data['strFunctionName'] }}" required>
                                                    @error('strFunctionName')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Function Date
                                                    <input type="Date" class="form-control" maxlength="150"
                                                        placeholder="Enter Function Date" name="strFunctionDate"
                                                        autocomplete="off" value="{{ $data['strFunctionDate'] }}" required>
                                                    @error('strFunctionDate')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div>
                                                    <span style="color:red;"></span>
                                                    Morning Time
                                                    <input type="time" class="form-control" maxlength="150"
                                                        placeholder="Enter Morning Time" name="strFunctionMorningTime"
                                                        autocomplete="off" value="{{ $data['strFunctionMorningTime'] }}">
                                                    @error('strFunctionMorningTime')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-6">
                                                <div>
                                                    <span style="color:red;"></span>
                                                    Evening Time
                                                    <input type="time" class="form-control" maxlength="150"
                                                        placeholder="Enter Evening Time" name="strFunctionEveningTime"
                                                        autocomplete="off" value="{{ $data['strFunctionEveningTime'] }}">
                                                    @error('strFunctionEveningTime')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Function Venue
                                                    <textarea type="text" class="form-control" placeholder="Enter Function Venue" name="strFunctionVanue"
                                                        autocomplete="off" required>{{ $data['strFunctionVanue'] }}</textarea>
                                                    @error('strFunctionVanue')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-6">
                                                <div>
                                                    <span style="color:red;"></span>Remarks
                                                    <textarea type="text" class="form-control" placeholder="Enter Remarks" name="strRemarks" autocomplete="off">{{ $data['strRemarks'] }}</textarea>
                                                    @error('strRemarks')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>

                                        </div>
                                        <div class="card-footer mt-5" style="float: right;">
                                            <button type="submit"
                                                class="btn btn-success btn-user float-right mb-3">Update</button>
                                            <a class="btn btn-success float-right mr-3 mb-3"
                                                href="{{ route('customer.index') }}">Cancel</a>
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
