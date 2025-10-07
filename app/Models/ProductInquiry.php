<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductInquiry extends Model
{
    use HasFactory;
    public $table = 'productinquiry';
    protected $fillable = [
        'inquiry_id',
        'name',
        'mobileNumber',
        'email',
        'message',
        'strIp',
        'location',
        'productid',
    ];
}
