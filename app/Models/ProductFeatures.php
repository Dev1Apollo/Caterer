<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductFeatures extends Model
{
    use HasFactory;
    public $table = 'product_features';
    protected $fillable = [
        'product_featuresId',
        'iProductId',
        'strLabel',
        'strValue',
        'strIP',
    ];
}
