<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Gadget extends Model
{
    protected $fillable = [
        'brand_id','category_id','name','slug','model','description','price','stock','release_date','rating_avg','published'
    ];

    protected $casts = [
        'price' => 'decimal:2',
        'release_date' => 'date',
        'published' => 'boolean',
    ];

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function images()
    {
        return $this->hasMany(GadgetImage::class);
    }

    public function specs()
    {
        return $this->hasMany(GadgetSpec::class);
    }

    public function reviews()
    {
        return $this->hasMany(Review::class);
    }
}
