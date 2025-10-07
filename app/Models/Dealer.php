<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dealer extends Model
{
    use HasFactory;
    public $table = 'dealer';
    protected $fillable = [
        'dealerId',
        'strName',
        'strEmail',
        'strMobile',
        'address1',
        'address2',
        'city',
        'pincode',
        'state',
        'country',
        'strIP',
    ];
}
