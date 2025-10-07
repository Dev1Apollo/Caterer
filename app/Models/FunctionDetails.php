<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FunctionDetails extends Model
{
    use HasFactory;
    public $table = 'functiondetails';
    protected $fillable = [
        'iFunctionDetailsId',
        'iFunctionId',
        'iProductId',
        'iCategoryId',
        'iSubCategoryId',
        'strIP',
        'isDelete',
        'iStatus',
        'created_at',
        'updated_at'
    ];
}
