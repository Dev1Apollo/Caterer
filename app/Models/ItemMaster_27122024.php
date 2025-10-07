<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ItemMaster extends Model
{
    use HasFactory;
    public $table = 'itemmaster';
    protected $fillable = [
        'iItemMasterId',
        'strItemMasterName',
        'iItemCategoryId',
        'iItemSubCategoryId',
        'iSequenceNo',
        'iStatus',
        'created_at',
        'updated_at',
        'strIP',
        'isDelete'
    ];
}
