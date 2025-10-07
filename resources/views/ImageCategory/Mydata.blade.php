@extends('layouts.app')
@section('title', 'Mydata List')
@section('content')
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.thumbnail a{width:100%; height:260px; overflow:hidden;display:block}
.thumbnail img{width:100%; height:100%; }
</style>
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
                <div class="col-lg-12">
                    <!-- Page Heading -->
                    <div class="card">
                        <div class="card-body">
                            <form method="post" id="form" action="{{ route('ImageCategory.Mydata') }}">
                                @csrf
                                <div class="row  align-items-center">
                                    <div class="col-md-3  mb-2">
                                        <div class="d-flex align-items-center">
                                            <select class="form-control" name="iItemCategoryId" id="" autofocus>
                                                <option selected value="">Select Category Name
                                                </option>
                                                @foreach ($ItemCategory as $category)
                                                    <option
                                                        value="{{ $category->id }}"{{ $iItemCategoryId == $category->id ? 'selected' : '' }}>
                                                        {{ $category->Imagecategoryname }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3 mb-2">
                                        <div class="input-group d-flex justify-content-right">
                                            <button type="submit" class="btn btn-success mx-3">
                                                Search
                                            </button>
                                            <a href="{{ route('ImageCategory.Mydata') }}" class="btn btn-success mx-2">
                                                Cancel
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    @forelse ($Imagedata as $key => $image)
                                        <div class="col-md-3">
                                            <div class="thumbnail">
                                                <a href="#" data-bs-toggle="modal" data-bs-target="#imageModal" data-index="{{ $key }}">
                                                    <img src="{{ asset('ImageCategory') . '/' . $image->photo }}" 
                                                        alt="Image {{ $key }}">
                                                </a>
                                            </div>
                                        </div>
                                    @empty
                                        <p>No images available</p>
                                    @endforelse
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal Start-->
                <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-md">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="imageModalLabel">Image</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div id="imageCarousel" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-inner">
                                        @forelse ($Imagedata as $key => $image)
                                            <div class="carousel-item {{ $key === 0 ? 'active' : '' }}">
                                                <img src="{{ asset('ImageCategory') . '/' . $image->photo }}" 
                                                    class="d-block w-100" alt="Image {{ $key }}">
                                            </div>
                                        @empty
                                            <div class="carousel-item active">
                                                <p>No images available.</p>
                                            </div>
                                        @endforelse
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#imageCarousel" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#imageCarousel" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <!-- Modal End-->

            </div>
        </div>
    </div>
@endsection
