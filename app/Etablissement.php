<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Etablissement extends Model
{
    //
    use SoftDeletes;

    protected $fillable = [
        'categorie_id', 'user_id', 'etablissement', 'description', 'email', 'adresse', 'zone_id', 'ville_id', 'maps', 'mensualite_min', 'mensualite_max', 'niveau_etude', 'tel', 'fax', 'whatsapp', 'site_web', 'photo', 'nom_contact', 'type'
        
    ];

    public function user(){

        return $this->belongsTo('App\User');
    }

    public function ville(){

        return $this->belongsTo('App\Ville');
    }

    public function categorie(){

        return $this->belongsTo('App\Categorie');
    }

    public function zone(){

        return $this->belongsTo('App\Zone');
    }

    public function niveau_etudes(){

        return $this->belongsToMany('App\Niveau_etude');
    
    }


}
