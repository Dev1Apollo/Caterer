<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ItemCategory extends Model
{
    use HasFactory;
    public $table = 'itemcategory';
    protected $fillable = [
        'iItemCategoryId',
        'strItemCategoryName',
        'strIP',
        'isDelete'
    ];
}
