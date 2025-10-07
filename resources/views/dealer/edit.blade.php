@extends('layouts.app')

@section('title', 'Edit Dealer')

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
                            <h4 class="mb-sm-0">Edit Dealer</h4>
                            <div class="page-title-right">
                                <a href="{{ route('dealer.index') }}"
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
                                        action="{{ route('dealer.update', $data->dealerId) }}"
                                        enctype="multipart/form-data">
                                        @csrf
                                        <div class="row gy-4">

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Name
                                                    <input type="text" class="form-control" placeholder="Enter Name"
                                                        maxlength="30" name="strName" autocomplete="off"
                                                        value="{{ $data->strName }}" required>
                                                    @error('strName')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Email
                                                    <input type="text" class="form-control" name="strEmail"
                                                        id="strEmail" placeholder="Enter Email" required autocomplete="off"
                                                        maxlength="30" value="{{ $data->strEmail }}">
                                                </div>
                                                @error('strEmail')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>


                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span>Mobile
                                                    <input type="text" class="form-control" name="strMobile"
                                                        onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
                                                        maxlength="10" minlength="10" id="strMobile"
                                                        placeholder="Enter Mobile" required autocomplete="off"
                                                        value="{{ $data->strMobile }}">
                                                </div>
                                                @error('strMobile')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>


                                            <div class="row mt-4">
                                                <div class="col-lg-4 col-md-6">
                                                    <div>
                                                        <span style="color:red;">*</span> Address 1
                                                        <input type="text" class="form-control" name="address1"
                                                            id="address1" placeholder="Enter Address 1" required
                                                            autocomplete="off" value="{{ $data->address1 }}">
                                                    </div>
                                                    @error('address1')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>

                                                <div class="col-lg-4 col-md-6">
                                                    <div>
                                                        <span style="color:red;">*</span> Address 2
                                                        <input type="text" class="form-control" name="address2"
                                                            id="address2" placeholder="Enter  Address 2" required
                                                            autocomplete="off" value="{{ $data->address2 }}">
                                                    </div>
                                                    @error('address2')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span> City
                                                    <input type="text" class="form-control" name="city" id="city"
                                                        placeholder="Enter City" required autocomplete="off" maxlength="30"
                                                        value="{{ $data->city }}">
                                                </div>
                                                @error('city')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span> State
                                                    <input type="text" class="form-control" name="state" id="state"
                                                        maxlength="30" placeholder="Enter State" required autocomplete="off"
                                                        value="{{ $data->state }}">
                                                </div>
                                                @error('state')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>

                                            <div class="col-lg-4 col-md-6">
                                                <div>
                                                    <span style="color:red;">*</span> Pincode
                                                    <input type="text" class="form-control" name="pincode"
                                                        id="pincode"
                                                        onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
                                                        maxlength="6" minlength="6" placeholder="Enter Pincode"
                                                        required autocomplete="off" value="{{ $data->pincode }}">
                                                </div>
                                                @error('pincode')
                                                    <span class="text-danger">{{ $message }}</span>
                                                @enderror
                                            </div>

                                        </div>
                                        <div class="card-footer mt-5" style="float: right;">
                                            <button type="submit"
                                                class="btn btn-success btn-user float-right mb-3">Save</button>
                                            <a class="btn btn-success float-right mr-3 mb-3"
                                                href="{{ route('dealer.index') }}">Cancel</a>
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

@endsection
