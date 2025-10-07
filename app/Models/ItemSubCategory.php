<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ItemSubCategory extends Model
{
    use HasFactory;

    public $table = 'itemsubcategory';
    protected $fillable = [
        'iItemSubCategoryId',
        'iItemCategoryId',
        'strItemSubCategoryName',
        'strIP',
        'isDelete'
    ];

    // Belongs to ItemCategory
    public function category()
    {
        return $this->belongsTo(ItemCategory::class, 'iItemCategoryId', 'iItemCategoryId');
    }

    // One-to-Many relationship with ItemMaster
    public function items()
    {
        return $this->hasMany(ItemMaster::class, 'iItemSubCategoryId', 'iItemSubCategoryId');
    }
}
