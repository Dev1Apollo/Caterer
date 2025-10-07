@extends('layouts.app')

@section('title', 'Customer Entry List')

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
                            <h4 class="mb-sm-0">Customer Entry List</h4>
                            <a href="{{ route('customer.create') }}" title="Add" class="btn btn-sm btn-success">
                                <i data-feather="plus"></i> Add New
                            </a>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <table id="scroll-horizontal" class="table nowrap align-middle" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th scope="col">Sr. No</th>
                                            <th scope="col">Customer Name</th>
                                            <th scope="col">Contact Details</th>
                                            <th scope="col">Customer Address</th>
                                            <th scope="col">Function Details</th>
                                            <th scope="col">Function Venue</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $i = 1; ?>
                                        @foreach ($Customers as $customer)
                                            <tr class="text-center">
                                                <td>
                                                    {{ $i + $Customers->perPage() * ($Customers->currentPage() - 1) }}
                                                </td>
                                                <td class="text-center">{{ $customer->strCustomerName }}</td>
                                                <td class="text-center">
                                                    Home Number :
                                                    {{ isset($customer->iMobileHouse) && $customer->iMobileHouse != 0 ? $customer->iMobileHouse : '-' }}
                                                    <br />
                                                    Office Number :
                                                    {{ isset($customer->iMobileOffice) && $customer->iMobileOffice != 0 ? $customer->iMobileOffice : '-' }}
                                                    <br />
                                                    Mobile :
                                                    {{ isset($customer->iMobileNo) && ($customer->iMobileNo != '' || $customer->iMobileNo != 0) ? $customer->iMobileNo : '-' }}
                                                </td>
                                                <td class="text-center">
                                                    {{ $customer->strAddress ?? '-' }}
                                                </td>
                                                <td class="text-center">
                                                    Function Name : {{ $customer->strFunctionName ?? '-' }} <br />
                                                    Function Date :
                                                    {{ isset($customer->strFunctionDate) && $customer->strFunctionDate != '' ? date('d-m-Y', strtotime($customer->strFunctionDate)) : '-' }}
                                                    <br />
                                                    Function Morning Time : {{ $customer->strFunctionMorningTime ?? '-' }}
                                                    <br />
                                                    Function Evening Time : {{ $customer->strFunctionEveningTime ?? '-' }}
                                                </td>
                                                <td class="text-center">
                                                    {{ $customer->strFunctionVanue ?? '-' }}
                                                </td>
                                                <td class="text-center">
                                                    <div class="dropdown">
                                                        <button class="btn btn-sm btn-secondary dropdown-toggle"
                                                            type="button" id="dropdownMenuButton" data-bs-toggle="dropdown"
                                                            aria-expanded="false">
                                                            Actions
                                                        </button>
                                                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="{{ route('customer.edit', $customer->iCustomerId) }}"
                                                                    title="Edit">
                                                                    <i class="far fa-edit"></i> Edit
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item" href="#"
                                                                    data-bs-toggle="modal" title="Delete"
                                                                    data-bs-target="#deleteRecordModal"
                                                                    onclick="deleteData(<?= $customer->iCustomerId ?>);">
                                                                    <i class="fa fa-trash" aria-hidden="true"></i> Delete
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="{{ route('customerfunction.index', $customer->iCustomerId) }}"
                                                                    title="Function">
                                                                    <i class="fa fa-plus" aria-hidden="true"></i> Function
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="{{ route('itemorder.index', $customer->iCustomerId) }}"
                                                                    title="Item Order">
                                                                    <i class="fa fa-plus" aria-hidden="true"></i> Item Order
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="{{ route('orderform.index', $customer->iCustomerId) }}"
                                                                    title="Order Form">
                                                                    <i class="fa fa-plus" aria-hidden="true"></i> Order Form
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="{{ route('customerfunction.customerfunctionpdf', $customer->iCustomerId) }}"
                                                                    title="Function">
                                                                    <i class="fa fa-file-pdf" aria-hidden="true"></i>
                                                                    Function PDF
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="{{ route('itemorder.itemorderpdf', $customer->iCustomerId) }}"
                                                                    title="Item Order">
                                                                    <i class="fa fa-file-pdf" aria-hidden="true"></i> Item
                                                                    Order PDF
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item"
                                                                    href="{{ route('orderform.itemorderpdf', $customer->iCustomerId) }}"
                                                                    title="Order Form">
                                                                    <i class="fa fa-file-pdf" aria-hidden="true"></i> Order
                                                                    Form PDF
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </td>

                                            </tr>
                                            <?php $i++; ?>
                                        @endforeach
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-center mt-3">
                                    {{ $Customers->appends(request()->except('page'))->links() }}
                                </div>
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
                            <input type="hidden" name="page" id="currentPage" value="{{ request('page', 1) }}">

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End Delete Modal -->

    <!--Add Modal -->
    <div class="modal fade zoomIn" id="addRecordModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Add Customer</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        id="btn-close"></button>
                </div>
                <form id="user-delete-form" method="POST" action="{{ route('customer.store') }}">
                    <div class="modal-body">
                        <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                            @csrf
                            <div class="row gy-4">
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Customer Name
                                        <input type="text" class="form-control" maxlength="150"
                                            placeholder="Enter Customer Name" name="strCustomerName" autocomplete="off"
                                            value="{{ old('strCustomerName') }}" required>
                                        @error('strCustomerName')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Customer Address
                                        <textarea type="text" class="form-control" placeholder="Enter Customer Address" name="strAddress"
                                            autocomplete="off" required> {{ old('strAddress') }} </textarea>
                                        @error('strAddress')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div>
                                        <!-- <span style="color:red;">*</span> -->Phone No. (Home)
                                        <input type="text" class="form-control" maxlength="10"
                                            placeholder="Enter Phone No. (Home)" name="iMobileHouse" autocomplete="off"
                                            value="{{ old('iMobileHouse') }}">
                                        @error('iMobileHouse')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div>
                                        <!-- <span style="color:red;">*</span> -->
                                        Phone No. (Office)
                                        <input type="text" class="form-control" maxlength="10"
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
                                        <input type="text" class="form-control" maxlength="10"
                                            placeholder="Enter Phone No. (Ho)" name="iMobileNo" autocomplete="off"
                                            value="{{ old('iMobileNo') }}">
                                        @error('iMobileNo')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>
                                        Funciton Name
                                        <input type="text" class="form-control" maxlength="150"
                                            placeholder="Enter Funciton Name" name="strFunctionName" autocomplete="off"
                                            value="{{ old('strFunctionName') }}" required>
                                        @error('strFunctionName')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>
                                        Funciton Date
                                        <input type="Date" class="form-control" maxlength="150"
                                            placeholder="Enter Funciton Date" name="strFunctionDate" autocomplete="off"
                                            value="{{ old('strFunctionDate') }}" required>
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
                                        <span style="color:red;">*</span>Funciton Venue
                                        <textarea type="text" class="form-control" placeholder="Enter Funciton Venue" name="strFunctionVanue"
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

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--End Delete Modal -->

    <!--edit Modal -->
    <div class="modal fade zoomIn" id="editRecordModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Add Customer</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        id="btn-close"></button>
                </div>
                <form id="user-delete-form" method="POST" action="{{ route('customer.update') }}">
                    <div class="modal-body">
                        <div class="d-flex gap-2 justify-content-center mt-4 mb-2">
                            @csrf
                            <input type="hidden" name="iCustomerId" id="iCustomerId" value="">
                            <div class="row gy-4">
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Customer Name
                                        <input type="text" class="form-control" maxlength="150"
                                            placeholder="Enter Customer Name" name="strCustomerName" id="strCustomerName"
                                            autocomplete="off" value="{{ old('strCustomerName') }}" required>
                                        @error('strCustomerName')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Customer Address
                                        <textarea type="text" class="form-control" placeholder="Enter Customer Address" name="strAddress"
                                            id="strAddress" autocomplete="off" required> {{ old('strAddress') }} </textarea>
                                        @error('strAddress')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div>
                                        <!-- <span style="color:red;">*</span> -->Phone No. (Home)
                                        <input type="text" class="form-control" maxlength="10"
                                            placeholder="Enter Phone No. (Home)" name="iMobileHouse" id="iMobileHouse"
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
                                        <input type="text" class="form-control" maxlength="10"
                                            placeholder="Enter Phone No. (Office)" name="iMobileOffice"
                                            id="iMobileOffice" autocomplete="off" value="{{ old('iMobileOffice') }}">
                                        @error('iMobileOffice')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Phone No. (Mobile)
                                        <input type="text" class="form-control" maxlength="10"
                                            placeholder="Enter Phone No. (Ho)" name="iMobileNo" id="iMobileNo"
                                            autocomplete="off" value="{{ old('iMobileNo') }}">
                                        @error('iMobileNo')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>
                                        Funciton Name
                                        <input type="text" class="form-control" maxlength="150"
                                            placeholder="Enter Funciton Name" name="strFunctionName" id="strFunctionName"
                                            autocomplete="off" value="{{ old('strFunctionName') }}" required>
                                        @error('strFunctionName')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>
                                        Funciton Date
                                        <input type="Date" class="form-control" maxlength="150"
                                            placeholder="Enter Funciton Date" name="strFunctionDate" id="strFunctionDate"
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
                                            id="strFunctionMorningTime" autocomplete="off"
                                            value="{{ old('strFunctionMorningTime') }}">
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
                                            id="strFunctionEveningTime" autocomplete="off"
                                            value="{{ old('strFunctionEveningTime') }}">
                                        @error('strFunctionEveningTime')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;">*</span>Funciton Venue
                                        <textarea type="text" class="form-control" placeholder="Enter Funciton Venue" name="strFunctionVanue"
                                            id="strFunctionVanue" autocomplete="off" required>{{ old('strFunctionVanue') }}</textarea>
                                        @error('strFunctionVanue')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-6">
                                    <div>
                                        <span style="color:red;"></span>Remarks
                                        <textarea type="text" class="form-control" placeholder="Enter Remarks" name="strRemarks" id="strRemarks"
                                            autocomplete="off">{{ old('strRemarks') }}</textarea>
                                        @error('strRemarks')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--End Delete Modal -->

@endsection

@section('scripts')


    <script>
        function deleteData(id) {
            $("#deleteid").val(id);
        }

        function getData(id) {
            var url = "{{ route('customer.edit', ':id') }}";
            url = url.replace(":id", id);
            $.ajax({
                type: 'GET',
                url: url,
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function(response) {
                    var obj = JSON.parse(response);

                    $("#strCustomerName").val(obj.strCustomerName);
                    $("#strAddress").val(obj.strAddress);
                    $("#iMobileHouse").val(obj.iMobileHouse);
                    $("#iMobileOffice").val(obj.iMobileOffice);
                    $("#iMobileNo").val(obj.iMobileNo);
                    $("#strFunctionName").val(obj.strFunctionName);
                    $("#strFunctionDate").val(obj.strFunctionDate);
                    $("#strFunctionMorningTime").val(obj.strFunctionMorningTime);
                    $("#strFunctionEveningTime").val(obj.strFunctionEveningTime);
                    $("#strFunctionVanue").val(obj.strFunctionVanue);
                    $("#iCustomerId").val(id);
                }
            });
        }
    </script>


    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


@endsection
