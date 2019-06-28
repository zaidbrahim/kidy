<?php

namespace App\Http\Controllers;

use FarhanWazir\GoogleMaps\GMaps;
use Illuminate\Http\Request;

use App\Etablissement;
use App\Categorie;
use App\Ville;
use App\Zone;
use App\Gmaps_geocach;

use App\Http\Requests;

class MapController extends Controller
{

    protected $gmap;

    public function __construct(GMaps $gmap){
        $this->gmap = $gmap;
    }

    public function index(){

        $devices = Gmaps_geocach::all();

        $lat = '33.5950627';
        $long = '-7.6187768';
        
        $config = array();

        $config['center'] = '33.5950627, -7.6187768';
        $config['geocodeCaching'] = true;
        $config['map_height'] = "100%";
        $config['zoom'] = "10";

        $this->gmap->initialize($config);

        // set up the marker ready for positioning
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

        foreach($devices as $device){


        $marker['position'] = ''.$device->latitude.', '.$device->longitude.'';
        $marker['infowindow_content'] = ''.$device->infowindow_content.'';
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
                                'map' => $map,
                                'categories' => $categories,
                                'villes' => $villes,
                                'etablissements' => $etablissements,

                                ]);
    }
}
