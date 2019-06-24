<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;

use App\Etablissement;
use App\Categorie;
use App\Ville;
use App\Zone;


class AnnuaireController extends Controller
{
    public function index(){

        $etablissements = Etablissement::orderByRaw('RAND()')
                ->with('categorie')
                ->with('ville')    
                ->paginate(12);
        
        $categories     = Categorie::orderBy('categorie', 'asc')->get();
        $villes         = Ville::where('etat', 1)
                                ->orderBy('ville', 'desc')->get();

        return view('annuaire', compact('etablissements', 'categories', 'villes', 'countries'));

    }

    public function getZones($id){

        $zones = Zone::where('ville_id', $id)->pluck('zone', 'id')->all();
        // return json_encode($zones);
        return response()->json($zones);
    }



    


    public function getCategories($categorie = null){

        if($categorie){


            $cat_id = Categorie::where('slug',$categorie)->value('id');

            $etablissements = Etablissement::where('etat', 1)
                ->whereIn('categorie_id', function($query) use ($cat_id){
                    $query->select('id')
                          ->from('categories')
                          ->where('id', $cat_id);
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

        $categories     = Categorie::orderBy('categorie', 'asc')->get();
        $villes         = Ville::where('etat', 1)
                                ->orderBy('ville', 'desc')->get();

        return view('annuaire', compact('etablissements', 'categories', 'villes'));
    }

    public function getVilles($ville = null){

        if ($ville){

            $etablissements = Etablissement::where('etat', 1)
                ->whereIn('ville_id', function($query) use ($ville){
                    $query->select('id')
                          ->from('villes')
                          ->where('id', '=', $ville);
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

        $categories     = Categorie::orderBy('categorie', 'asc')->get();
        $villes         = Ville::where('etat', 1)
                                ->orderBy('ville', 'desc')->get();

        return view('annuaire', compact('etablissements', 'categories', 'villes'));

    }

    // public function getZone(Request $request){
        
    //     $select = $request->get('select');
    //     $value = $request->get('value');
    //     $dependent = $request->get('dependent');


    //     $zones = Zone::where('ville_id', $value)
    //                 ->orderBy('zone', 'ASC')
    //                 ->get();

                    
    //     $output = '<option value="">'.ucfirst($dependent).'</option>';
    //     foreach($zones as $zone)
    //     {
    //         $output .= '<option value="'.$zone->id.'">'.$zone->zone.'</option>';
    //     }

    //     echo $output;

    // }

   

    public function search(Request $request){

        $data = $request->all();

        $etablissements =  Etablissement::select('*')
            ->when(!empty($data['search']) , function ($query) use($data){
                return $query->where('etablissement','like', '%'.$data['search'].'%');
            })
            ->when(!empty($data['ville']) || empty($data['zone']), function ($query) use($data){
                return $query->where('ville_id',$data['ville']);
            })
            ->when(!empty($data['categorie']) , function ($query) use($data){
                return $query->where('categorie_id',$data['categorie']);
            })
            ->when(!empty($data['zone']) , function ($query) use($data){
                return $query->where('zone_id',$data['zone']);
            })

            ->paginate(12);
                       
        // $requete = "App\Etablissement::where('etat', 1)";

        // if($search){
        //     $requete .= "->where('etablissement','like','%'.$search.'%')";
        // }

        // if($ville){
        //     $requete .= "->where('ville_id', $ville)";
        // }

        // if($categorie){
        //     $requete .= "->where('categorie_id', $categorie)";
        // }

        // $requete .= "->orderBy('id', 'desc')";

        // $requete .= "->paginate(12)";

        // $etablissements = Etablissement::where('etat', '=', 1)
        //     ->where(function ($query) use ($search, $ville, $categorie, $requete){
        //          $query->$requete
        //          ->orderBy('id','desc');
        //     })
        //     ->paginate(12);
        
        //eval("\$etablissements=$requete;");


        $categories     = Categorie::orderBy('id', 'asc')->get();
        $villes         = Ville::orderBy('id', 'desc')->get();

        return view('annuaire', compact('etablissements', 'categories', 'villes'));
    }
}
