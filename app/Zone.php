<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Zone extends Model
{
    use SoftDeletes;
    
    protected $fillable = [
        'zone', 'ville_id'
        
    ];

    public function ville(){

        return $this->belongsTo('App\Ville');
    }


    public function etablissements() {

        return $this->hasMany('App\Etablissement');
        
    } 

}
