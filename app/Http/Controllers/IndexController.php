<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Categorie;
use App\Etablissement;
use App\Ville;
use App\Zone;
use App\Niveau_etude;

class IndexController extends Controller
{

    /**
     * Get Ajax Request and restun Data
     *
     * @return \Illuminate\Http\Response
     */
    
    public function home(){
        
        $etablissements = Etablissement::where('etat', '=', 1)
           //->where('photo' ,'!=', 'default.png')
            ->orderByRaw('RAND()')
            ->get();

        $categories = Categorie::orderBy('categorie', 'ASC')
                    ->withCount('etablissements')            
                    ->get();

        $lasts = Etablissement::where('etat', '=', 1)
            ->orderBy('created_at','ASC')
            ->take(6)
            ->get();

        
        $villes = Ville::where('etat', 1)
            ->where('favorie', 1)
            ->orderBy('id', 'asc')
            ->get();

        $cities = Ville::pluck("ville", "id")
                    ->all(); 
    
        $niveaux = Niveau_etude::orderBy('id', 'asc')->get();

    	return view('index', compact('etablissements', 'categories', 'villes', 'lasts', 'cities', 'niveaux'));
        
    }

    public function getZones($id){
        
        $zones = Zone::where("ville_id", $id)
                    ->orderBy('zone', 'ASC')
                    ->pluck("zone", "id")
                    ->all();

        return json_encode($zones);
    }

}
