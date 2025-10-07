<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FunctionMaster extends Model
{
    use HasFactory;
    public $table = 'functionmaster';
    protected $fillable = [
        'iFunctionId',
        'iCustomerId',
        'strFunction',
        'strDate',
        'iNoOfPerosn',
        'iRatePerPerson',
        'iTotalAmount',
        'strLocation',
        'strIP',
        'isDelete',
        'iStatus',
        'created_at',
        'updated_at'
    ];
}
