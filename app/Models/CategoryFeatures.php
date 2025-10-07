<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CategoryFeatures extends Model
{
    use HasFactory;
    public $table = 'category_features';
    protected $fillable = [
        'category_featuresId',
        'iCategoryId',
        'strLabel',
        'strValue',
        'strIP',
    ];
}
