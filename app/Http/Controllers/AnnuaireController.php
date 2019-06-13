<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Etablissement;
use App\Categorie;
use App\Ville;


class AnnuaireController extends Controller
{
    public function index($categorie = null){

        if($categorie){

            $cat_id = Categorie::where('slug',$categorie)->value('id');

            // select * from etablissements where categorie_id in( SELECT id from categories where slug = 'ecoles')

            $etablissements = Etablissement::where('etat', '=', 1)
                ->whereIn('categorie_id', function($query) use ($cat_id){
                    $query->select('id')
                          ->from('categories')
                          ->where('id', '=', $cat_id);
                    })
                    ->orderBy('created_at', 'DESC')
                    ->paginate(12);
        }
        else{

            $etablissements = Etablissement::orderByRaw('RAND()')
                ->with('categorie')
                ->with('ville')    
                ->paginate(12);
        } 

        $categories = Categorie::orderBy('id', 'asc')->get();
        $villes = Ville::orderBy('id', 'desc')->get();

        return view('annuaire', compact('etablissements', 'categories', 'villes'));

    }

    public function search(){
        
    }
}
