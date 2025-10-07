<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImageCategory extends Model
{
    use HasFactory;
    public $table = 'imagecategory';
    protected $fillable = [
        'id',
        'Imagecategoryname',
        'slugname',
        'strIP',
    ];
}
