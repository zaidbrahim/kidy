<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Niveau_etude extends Model
{
    
    protected $fillable = [
        
        'niveau'
        
    ];

    public function etablissements() {

    	return $this->belongsToMany('App\Etablissement');
    }
}
