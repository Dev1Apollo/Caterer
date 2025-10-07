<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderMaster extends Model
{
    use HasFactory;
    public $table = 'orderformmaster';
    protected $fillable = [
        'iOrderFormMasterId',
        'iType',
        'iCustomerId',
        'strCustomerName',
        'iPhoneNo',
        'iPhoneNoHome',
        'strDeliveryAddress',
        'strDate',
        'strTime',
        'created_at',
        'updated_at',
        'strIP',
        'isDelete',
        'iStatus'
    ];
}
