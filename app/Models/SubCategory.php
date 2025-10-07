<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    use HasFactory;
    public $table = 'sub_category';
    protected $fillable = [
        'sub_categoryId',
        'categoryId',
        'strSequenceNo',
        'subcategoryname',
        'slugname',
        'photo',
        'strIP',
        'meta_title',
        'meta_description',
        'iStatus',
        'isDelete',
        'created_at',
        'updated_at'
    ];
}
