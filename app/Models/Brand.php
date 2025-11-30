<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    protected $fillable = ['name', 'slug', 'description', 'logo_path'];

    public function gadgets()
    {
        return $this->hasMany(Gadget::class);
    }
}
