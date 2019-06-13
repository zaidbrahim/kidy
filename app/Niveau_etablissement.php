<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Niveau_etablissement extends Model
{
    protected $fillable = [
        'etablissement_id', 'niveau_etude_id'
        
    ];
}
