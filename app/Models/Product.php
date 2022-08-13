<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Category;

class Product extends Model
{
    use HasFactory;

    protected $table = 'products';

    protected $fillable = [
        'category_id',
        'meta_title',
        'meta_keyword',
        'meta_descrip',
        'slug',
        'name',
        'description',
        'selling_price',
        'original_price',
        'qty',
        'brand',
        'image',
        'featured',
        'popular',
        'status',
    ];

    protected $with = ['category'];
    
    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }
}
