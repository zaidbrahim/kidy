<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Ville extends Model
{
    use SoftDeletes;
    
    protected $fillable = [
        'ville',
    ];

    public function zones() {

        return $this->hasMany('App\Zone');
        
    }
}