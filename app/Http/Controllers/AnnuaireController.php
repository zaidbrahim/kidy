<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use FarhanWazir\GoogleMaps\GMaps;

use App\Etablissement;
use App\Categorie;
use App\Ville;
use App\Zone;
use App\Gmaps_geocach;

class AnnuaireController extends Controller{

    protected $gmap;

    public function __construct(GMaps $gmap){

        $this->gmap = $gmap;

    }

    public function index(){

        $positions = Etablissement::where('latitude','!=', '')
                                  ->where('longitude','!=', '')
                                  ->get();

        $config = array();

        $config['center']           = '33.565486, -7.626999';
        $config['geocodeCaching']   = true;
        $config['map_height']       = "100%";
        $config['zoom']             = "13";

        $this->gmap->initialize($config);


        $marker = array();
        $marker['draggable'] = true;
        $marker['ondragend'] = '
        iw_'. $this->gmap->map_name .'.close();
        reverseGeocode(event.latLng, function(status, result, mark){
            if(status == 200){
                iw_'. $this->gmap->map_name .'.setContent(result);
                iw_'. $this->gmap->map_name .'.open('. $this->gmap->map_name .', mark);
            }
        }, this);
        ';

        foreach($positions as $position){

            $marker['position']             = ''.$position->latitude.', '.$position->longitude.'';
            $marker['infowindow_content']   = ''.$position->etablissement.'';
            
            $this->gmap->add_marker($marker);
            
        }

        $map = $this->gmap->create_map();

        $etablissements  = Etablissement::orderByRaw('RAND()')
            ->with('categorie')
            ->with('ville')
            ->paginate(12);

        $categories      = Categorie::orderBy('categorie', 'asc')->get();

        $villes          = Ville::where('etat', 1)
            ->orderBy('ville', 'desc')->get();


        return view('annuaire', [

            'categories'        => $categories,
            'villes'            => $villes,
            'etablissements'    => $etablissements,
            'map'               => $map,

        ]);

    }

    public function getZones($id){

        $zones = Zone::where('ville_id', $id)->pluck('zone', 'id')->all();
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


    public function search(Request $request){

        $data = $request->all();

        $positions = Etablissement::select('*')
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
            ->where('latitude','!=', '')
            ->where('longitude','!=', '')
            ->get();

        $config = array();

        $latitude   = Ville::where('id', $data['ville'])->value('latitude');
        $longitude  = Ville::where('id', $data['ville'])->value('longitude');



        $config['center']           = ''.$latitude.', '.$longitude.'';
        $config['geocodeCaching']   = true;
        $config['map_height']       = "100%";
        $config['zoom']             = "10";

        $this->gmap->initialize($config);

        $marker = array();
        $marker['draggable'] = true;
        $marker['ondragend'] = '
        iw_'. $this->gmap->map_name .'.close();
        reverseGeocode(event.latLng, function(status, result, mark){
            if(status == 200){
                iw_'. $this->gmap->map_name .'.setContent(result);
                iw_'. $this->gmap->map_name .'.open('. $this->gmap->map_name .', mark);
            }
        }, this);
        ';

        foreach($positions as $position){

            $marker['position']             = ''.$position->latitude.', '.$position->longitude.'';
            $marker['infowindow_content']   = ''.$position->etablissement.'';

            $this->gmap->add_marker($marker);

        }

        $map = $this->gmap->create_map();



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


        $categories     = Categorie::orderBy('id', 'asc')->get();
        $villes         = Ville::orderBy('id', 'desc')->get();

        return view('annuaire', compact('etablissements', 'categories', 'villes', 'map'));
    }
}