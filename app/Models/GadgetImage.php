<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GadgetImage extends Model
{
    protected $fillable = ['gadget_id','path','caption','position'];

    public function gadget()
    {
        return $this->belongsTo(Gadget::class);
    }
}
