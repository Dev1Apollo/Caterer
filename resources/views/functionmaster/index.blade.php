@extends('layouts.app')

@section('title', 'Function Master List')

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
                            <div>
                                <h4 class="mb-sm-0"> Function List</h4>
                            </div>
                            <div>
                                <a href="{{ route('customerfunction.create', $id) }}" title="Add"
                                    class="btn btn-sm btn-success">
                                    <i data-feather="plus"></i> Add New
                                </a>
                                <a href="{{ route('customer.index') }}" title="Back" class="btn btn-sm btn-success">
                                    <i data-feather="arrow-left"></i> Back
                                </a>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mb-sm-0">Customer Details</h4>
                                <table id="scroll-horizontal" class="table nowrap align-middle" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th scope="col">Customer Name</th>
                                            <th scope="col">Contact Details</th>
                                            <th scope="col">Customer Address</th>
                                            <th scope="col">Function Details</th>
                                            <th scope="col">Function Venue</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="text-center">
                                            <td class="text-center">{{ $Customers->strCustomerName }}</td>
                                            <td class="text-center">
                                                Home Number :
                                                {{ isset($Customers->iMobileHouse) && $Customers->iMobileHouse != 0 ? $Customers->iMobileHouse : '-' }}
                                                <br />
                                                Office Number :
                                                {{ isset($Customers->iMobileOffice) && $Customers->iMobileOffice != 0 ? $Customers->iMobileOffice : '-' }}
                                                <br />
                                                Mobile :
                                                {{ isset($Customers->iMobileNo) && ($Customers->iMobileNo != '' || $Customers->iMobileNo != 0) ? $Customers->iMobileNo : '-' }}
                                            </td>
                                            <td class="text-center">
                                                {{ $Customers->strAddress ?? '-' }}
                                            </td>
                                            <td class="text-center">
                                                Function Name : {{ $Customers->strFunctionName ?? '-' }} <br />
                                                Function Date :
                                                {{ isset($Customers->strFunctionDate) && $Customers->strFunctionDate != '' ? date('d-m-Y', strtotime($Customers->strFunctionDate)) : '-' }}
                                                <br />
                                                Function Morning Time : {{ $Customers->strFunctionMorningTime ?? '-' }}
                                                <br />
                                                Function Evening Time : {{ $Customers->strFunctionEveningTime ?? '-' }}
                                            </td>
                                            <td class="text-center">
                                                {{ $Customers->strFunctionVanue ?? '-' }}
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
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
                                            <th scope="col">Function Name</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Person</th>
                                            <th scope="col">Rate</th>
                                            <th scope="col">Total Amount</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $i = 1; ?>
                                        @foreach ($FunctionMasters as $functionMaster)
                                            <tr class="text-center">
                                                <td>
                                                    {{ $i + $FunctionMasters->perPage() * ($FunctionMasters->currentPage() - 1) }}
                                                </td>
                                                <td class="text-center">{{ $functionMaster->strFunction }}</td>
                                                <td class="text-center">
                                                    Function Date :
                                                    {{ isset($functionMaster->strDate) && $functionMaster->strDate != '' ? date('d-m-Y', strtotime($functionMaster->strDate)) : '-' }}
                                                    <br />
                                                </td>
                                                <td class="text-center">
                                                    {{ $functionMaster->iNoOfPerosn ?? '-' }}
                                                </td>
                                                <td class="text-center">
                                                    {{ $functionMaster->iRatePerPerson ?? '-' }}
                                                </td>
                                                <td class="text-center">
                                                    {{ $functionMaster->iTotalAmount ?? '-' }}
                                                </td>
                                                <td class="text-center">
                                                    <a class="mx-1" title="Edit"
                                                        href="{{ route('customerfunction.edit', $functionMaster->iFunctionId) }}">
                                                        <i class="far fa-edit"></i>
                                                    </a>
                                                    <a class="mx-1" href="#" data-bs-toggle="modal" title="Delete"
                                                        data-bs-target="#deleteRecordModal"
                                                        onclick="deleteData(<?= $functionMaster->iFunctionId ?>);">
                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <?php $i++; ?>
                                        @endforeach
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-center mt-3">
                                    {{ $FunctionMasters->appends(request()->except('page'))->links() }}
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
                        <form id="user-delete-form" method="POST" action="{{ route('customerfunction.delete') }}">
                            @csrf
                            @method('DELETE')
                            <input type="hidden" name="iFunctionId" id="deleteid" value="">

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
        function deleteData(id) {
            $("#deleteid").val(id);
        }
    </script>


    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


@endsection
