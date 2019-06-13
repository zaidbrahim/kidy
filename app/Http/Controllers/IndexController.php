<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Categorie;
use App\Etablissement;

class IndexController extends Controller
{
    public function home()
    {
        
        $etablissements = Etablissement::where('etat', '=', 1)
           //->where('photo' ,'!=', 'default.png')
            ->orderByRaw('RAND()')
            ->get();

        $categories = Categorie::orderBy('id', 'ASC')
                    ->withCount('etablissements')            
                    ->get();

        $lasts = Etablissement::where('etat', '=', 1)
            ->orderBy('created_at','ASC')
            ->take(6)
            ->get();

        

    	// $promotions = Promotion::orderBy('created_at','ASC')
        //     ->where('started_at','<=',\Carbon\Carbon::now())
        //     ->where('finished_at','>=',\Carbon\Carbon::now())
        //     ->take(6)
        //     ->get();

    	return view('index', compact('etablissements', 'lasts', 'categories'));
        
    }
}
