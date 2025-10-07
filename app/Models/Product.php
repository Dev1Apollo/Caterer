<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    public $table = 'product';
    protected $fillable = [
        'productId',
        'strSequenceNo',
        'showOnFooter',
        'categoryId',
        'iSubCategoryId',
        'productname',
        'slugname',
        'description',
        'strElectricalData',
        'strHopperContainerCapacity',
        'strMotorSpeed',
        'strPowerConsumption',
        'strPowerRequirement',
        'strBodyMaterial',
        'strBodySize',
        'strNetWeight',
        'ShowHomePage',
        'strIP',
        'meta_title',
        'meta_description',
    ];
}
