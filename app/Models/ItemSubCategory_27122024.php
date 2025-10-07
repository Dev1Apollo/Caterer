<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ItemSubCategory extends Model
{
    use HasFactory;

    public $table = 'itemsubcategory';
    protected $fillable = [
        'iItemSubCategoryId',
        'iItemCategoryId',
        'strItemSubCategoryName',
        'strIP',
        'isDelete'
    ];
}
