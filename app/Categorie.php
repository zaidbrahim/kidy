<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Categorie extends Model
{

    use SoftDeletes;
    
    protected $fillable = [
        'categorie',
    ];

    public function etablissements() {

        return $this->hasMany('App\Etablissement');
        
    } 
}
