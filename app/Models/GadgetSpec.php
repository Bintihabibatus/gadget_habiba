<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GadgetSpec extends Model
{
    protected $fillable = ['gadget_id','key','value'];

    public function gadget()
    {
        return $this->belongsTo(Gadget::class);
    }
}
