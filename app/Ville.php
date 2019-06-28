<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Ville extends Model
{
    use SoftDeletes;
    
    protected $fillable = [
        'ville', 'latitude', 'longitude'
    ];

    public function zones() {

        return $this->hasMany('App\Zone');
        
    }

    public function etablissements() {

        return $this->hasMany('App\Etablissement');
        
    }  
}