<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Etablissement_niveau_etude extends Model
{
    protected $fillable = [
        'etablissement_id', 'niveau_etude_id'
        
    ];
}
