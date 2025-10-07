<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ItemCategory extends Model
{
    use HasFactory;
    public $table = 'itemcategory';
    protected $fillable = [
        'iItemCategoryId',
        'strItemCategoryName',
        'strIP',
        'isDelete'
    ];

    // One-to-Many relationship with ItemSubCategory
    public function subcategories()
    {
        return $this->hasMany(ItemSubCategory::class, 'iItemCategoryId', 'iItemCategoryId');
    }

    // One-to-Many relationship with ItemMaster
    public function items()
    {
        return $this->hasMany(ItemMaster::class, 'iItemCategoryId', 'iItemCategoryId');
    }
}
