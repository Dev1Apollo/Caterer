<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;
    public $table = 'customer';
    protected $fillable = [
        'iCustomerId',
        'strCustomerName',
        'strAddress',
        'iMobileHouse',
        'iMobileOffice',
        'iMobileNo',
        'strFunctionName',
        'strFunctionDate',
        'strFunctionMorningTime',
        'strFunctionEveningTime',
        'strFunctionVanue',
        'strRemarks',
        'strIP',
        'isDelete',
        'iStatus',
        'created_at',
        'updated_at'
    ];
}
