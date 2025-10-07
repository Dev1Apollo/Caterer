<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ItemOrder extends Model
{
    use HasFactory;
    public $table = 'itemorder';
    protected $fillable = [
        'iItemOrderId',
        'iCustomerId',
        'iItemMasterId',
        'strPreviousDays',
        'strMoring',
        'strAfternoon',
        'strEvening',
        'created_at',
        'updated_at',
        'strIP',
        'isDelete',
        'iStatus'
    ];
}
