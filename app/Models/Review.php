<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    protected $fillable = ['gadget_id','user_id','guest_name','guest_email','rating','body','approved'];

    protected $casts = [
        'approved' => 'boolean',
    ];

    public function gadget()
    {
        return $this->belongsTo(Gadget::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
