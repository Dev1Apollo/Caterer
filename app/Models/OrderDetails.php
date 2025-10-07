<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderDetails extends Model
{
    use HasFactory;
    public $table = 'orderformdetails';
    protected $fillable = [
        'iOrderFormDetailsId',
        'iOrderFormMasterId',
        'iItemCategoryId',
        'iItemSubCategoryId',
        'iItemMasterId',
        'strKG',
        'strGram',
        'strCount',
        'created_at',
        'updated_at',
        'strIP',
        'isDelete',
        'iStatus'
    ];
    
    public function orderMaster()
{
    return $this->belongsTo(OrderMaster::class, 'iOrderFormMasterId', 'iOrderFormMasterId');
}

}
