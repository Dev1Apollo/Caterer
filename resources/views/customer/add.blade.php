@extends('layouts.app')

@section('title', 'Add Customer')

@section('content')

    <meta name="csrf-token" id="csrf-token" content="{{ csrf_token() }}">
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">

               
                {{-- Alert Messages --}}
                @include('common.alert')

                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">Add Customer</h4>
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
                                        action="{{ route('customer.store') }}" enctype="multipart/form-data">
                                        @csrf
                                        <div class="row gy-4">

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Customer Name
                                                    <input type="text" class="form-control" maxlength="50"
                                                        placeholder="Enter Customer Name" name="strCustomerName"
                                                        autocomplete="off" value="{{ old('strCustomerName') }}" required>
                                                    @error('strCustomerName')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Customer Address
                                                    <textarea type="text" class="form-control" placeholder="Enter Customer Address" name="strAddress" autocomplete="off"
                                                        required> {{ old('strAddress') }} </textarea>
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
                                                        autocomplete="off" value="{{ old('iMobileHouse') }}">
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
                                                        autocomplete="off" value="{{ old('iMobileOffice') }}">
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
                                                        autocomplete="off" value="{{ old('iMobileNo') }}">
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
                                                        autocomplete="off" value="{{ old('strFunctionName') }}" required>
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
                                                        autocomplete="off" value="{{ old('strFunctionDate') }}" required>
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
                                                        autocomplete="off" value="{{ old('strFunctionMorningTime') }}">
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
                                                        autocomplete="off" value="{{ old('strFunctionEveningTime') }}">
                                                    @error('strFunctionEveningTime')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Function Venue
                                                    <textarea type="text" class="form-control" placeholder="Enter Function Venue" name="strFunctionVanue"
                                                        autocomplete="off" required>{{ old('strFunctionVanue') }}</textarea>
                                                    @error('strFunctionVanue')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-6">
                                                <div>
                                                    <span style="color:red;"></span>Remarks
                                                    <textarea type="text" class="form-control" placeholder="Enter Remarks" name="strRemarks" autocomplete="off">{{ old('strRemarks') }}</textarea>
                                                    @error('strRemarks')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>

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
    </div>

@endsection
