<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SubCategoryController;
use App\Http\Controllers\ItemMasterController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\FunctionController;
use App\Http\Controllers\ItemOrderController;
use App\Http\Controllers\OrderFormController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect()->route('login');
});

Auth::routes(['register' => false]);

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

// Profile Routes
Route::prefix('profile')->name('profile.')->middleware('auth')->group(function () {
    Route::get('/', [HomeController::class, 'getProfile'])->name('detail');
    Route::get('/edit', [HomeController::class, 'EditProfile'])->name('EditProfile');
    Route::post('/update', [HomeController::class, 'updateProfile'])->name('update');
    Route::post('/change-password', [HomeController::class, 'changePassword'])->name('change-password');
});

Route::get('logout', [LoginController::class, 'logout'])->name('logout');

// Roles
Route::resource('roles', App\Http\Controllers\RolesController::class);

// Permissions
Route::resource('permissions', App\Http\Controllers\PermissionsController::class);

// Users
Route::middleware('auth')->prefix('users')->name('users.')->group(function () {
    Route::get('/', [UserController::class, 'index'])->name('index');
    Route::get('/create', [UserController::class, 'create'])->name('create');
    Route::post('/store', [UserController::class, 'store'])->name('store');
    Route::get('/edit/{id?}', [UserController::class, 'edit'])->name('edit');
    Route::post('/update/{user}', [UserController::class, 'update'])->name('update');
    Route::delete('/delete/{user}', [UserController::class, 'delete'])->name('destroy');
    Route::get('/update/status/{user_id}/{status}', [UserController::class, 'updateStatus'])->name('status');
    Route::post('/password-update/{Id?}', [UserController::class, 'passwordupdate'])->name('passwordupdate');
    Route::get('/import-users', [UserController::class, 'importUsers'])->name('import');
    Route::post('/upload-users', [UserController::class, 'uploadUsers'])->name('upload');
    Route::get('export/', [UserController::class, 'export'])->name('export');
});

//Category Master
Route::prefix('admin')->name('category.')->middleware('auth')->group(function () {
    Route::get('/category/index', [CategoryController::class, 'index'])->name('index');
    Route::post('/category/store', [CategoryController::class, 'create'])->name('store');
    Route::get('/category/edit/{id?}', [CategoryController::class, 'editview'])->name('edit');
    Route::post('/category/update', [CategoryController::class, 'update'])->name('update');
    Route::delete('/category/delete', [CategoryController::class, 'delete'])->name('delete');
    Route::post('/category/image/delete', [CategoryController::class, 'imagedelete'])->name('imagedelete');
});

//subcategory Master
Route::prefix('admin')->name('subcategory.')->middleware('auth')->group(function () {
    Route::get('/SubCategory/index', [SubCategoryController::class, 'index'])->name('index');
    Route::post('/SubCategory/store', [SubCategoryController::class, 'create'])->name('store');
    Route::get('/SubCategory/edit/{id?}', [SubCategoryController::class, 'editview'])->name('edit');
    Route::post('/SubCategory/update', [SubCategoryController::class, 'update'])->name('update');
    Route::delete('/SubCategory/delete', [SubCategoryController::class, 'delete'])->name('delete');
    Route::post('/SubCategory/image/delete', [SubCategoryController::class, 'imagedelete'])->name('imagedelete');
});


//subcategory Master
Route::prefix('admin')->name('itemmaster.')->middleware('auth')->group(function () {
    Route::any('/itemmaster/index', [ItemMasterController::class, 'index'])->name('index');
    Route::get('/itemmaster/store', [ItemMasterController::class, 'create'])->name('create');
    Route::post('/itemmaster/store', [ItemMasterController::class, 'store'])->name('store');
    Route::get('/itemmaster/edit/{id?}', [ItemMasterController::class, 'editview'])->name('edit');
    Route::post('/itemmaster/update', [ItemMasterController::class, 'update'])->name('update');
    Route::delete('/itemmaster/delete', [ItemMasterController::class, 'delete'])->name('delete');
    Route::get('/itemmaster/getsubcategory/{id?}', [ItemMasterController::class, 'getsubcategory'])->name('getsubcategory');
});


//Product Master
Route::prefix('admin')->name('product.')->middleware('auth')->group(function () {
    Route::any('/product/index', [ProductController::class, 'index'])->name('index');
    Route::get('/product/create', [ProductController::class, 'createview'])->name('create');
    Route::post('/product/store', [ProductController::class, 'store'])->name('store');
    Route::get('/product/edit/{id?}', [ProductController::class, 'editview'])->name('edit');
    Route::post('/product/update/{id?}', [ProductController::class, 'update'])->name('update');
    Route::delete('/product/delete', [ProductController::class, 'delete'])->name('delete');
    Route::get('/product/getsubcategory/{id?}', [ProductController::class, 'getsubcategory'])->name('getsubcategory');
    Route::post('productimage-delete/{id}', [ProductController::class, 'productimage'])->name('imagedelete');
    Route::get('/product/photos/{id?}', [ProductController::class, 'productphotos'])->name('productphotos');
    Route::post('/product/photos/store', [ProductController::class, 'productphotosstore'])->name('productphotosstore');
    Route::delete('/product/photos/delete/{id?}', [ProductController::class, 'productphotosdelete'])->name('productphotosdelete');
});

//customer Master
Route::prefix('admin')->name('customer.')->middleware('auth')->group(function () {
    Route::any('/customer/index', [CustomerController::class, 'index'])->name('index');
    Route::get('/customer/create', [CustomerController::class, 'createview'])->name('create');
    Route::post('/customer/store', [CustomerController::class, 'store'])->name('store');
    Route::get('/customer/edit/{id?}', [CustomerController::class, 'editview'])->name('edit');
    Route::post('/customer/update/{id?}', [CustomerController::class, 'update'])->name('update');
    Route::delete('/customer/delete', [CustomerController::class, 'delete'])->name('delete');
});

//customer function Master
Route::prefix('admin')->name('customerfunction.')->middleware('auth')->group(function () {
    Route::any('/function/index/{id?}', [FunctionController::class, 'index'])->name('index');
    Route::get('/function/create/{id?}', [FunctionController::class, 'createview'])->name('create');
    Route::post('/function/store', [FunctionController::class, 'store'])->name('store');
    Route::get('/function/edit/{id?}', [FunctionController::class, 'editview'])->name('edit');
    Route::post('/function/update', [FunctionController::class, 'update'])->name('update');
    Route::delete('/function/delete', [FunctionController::class, 'delete'])->name('delete');
    Route::any('/function/pdf/{id?}', [FunctionController::class, 'customerfunctionpdf'])->name('customerfunctionpdf');
});

//customer function Master
Route::prefix('admin')->name('itemorder.')->middleware('auth')->group(function () {
    Route::any('/itemorder/index/{id?}', [ItemOrderController::class, 'index'])->name('index');
    Route::post('/itemorder/store', [ItemOrderController::class, 'store'])->name('store');
    Route::get('/itemorder/edit/{id?}', [ItemOrderController::class, 'editview'])->name('edit');
    Route::post('/itemorder/update', [ItemOrderController::class, 'update'])->name('update');
    Route::delete('/itemorder/delete', [ItemOrderController::class, 'delete'])->name('delete');
    Route::any('/itemorder/pdf/{id?}', [ItemOrderController::class, 'itemorderpdf'])->name('itemorderpdf');
});

//customer function Master
Route::prefix('admin')->name('orderform.')->middleware('auth')->group(function () {
    Route::any('/orderform/index/{id?}', [OrderFormController::class, 'index'])->name('index');
    Route::post('/orderform/store', [OrderFormController::class, 'store'])->name('store');
    Route::get('/orderform/edit/{id?}', [OrderFormController::class, 'editview'])->name('edit');
    Route::post('/orderform/update', [OrderFormController::class, 'update'])->name('update');
    Route::delete('/orderform/delete', [OrderFormController::class, 'delete'])->name('delete');
    Route::any('/orderform/pdf/{id?}', [OrderFormController::class, 'itemorderpdf'])->name('itemorderpdf');
    Route::get('/orderform/getitems/{id?}', [OrderFormController::class, 'getitems'])->name('getitems');
});
