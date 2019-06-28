<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Etablissement;
use App\Zone;
use App\Ville;
use App\Categorie;
use App\Niveau_etude;
use App\Etablissement_niveau_etude;

class EtablissementController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(\Gate::allows('isAdmin') || \Gate::allows('isUser')) {
            
            $etablissements = Etablissement::latest()
                    ->with('zone')
                    ->with('ville')
                    ->with('categorie')
                    ->paginate(10);

            $villes = Ville::orderBy('ville','DESC')->get();
            $zones = Zone::orderBy('zone','DESC')->get();
            $categories = Categorie::orderBy('categorie','DESC')->get();
            $niveau_etudes = Niveau_etude::orderBy('niveau', 'DESC')->get();
        
            return [
               'etablissements' => $etablissements,
               'villes' => $villes,
               'zones' => $zones,
               'categories' => $categories,
               'niveau_etudes' => $niveau_etudes,
            ];
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [

            'zone_id' => 'required',
            'ville_id' => 'required',
            'categorie_id' => 'required',
            //'email' => 'required|email',
            'etablissement'=> 'required|min:3|max:255',
            'nom_contact'=> 'required|min:3',
            'tel'=> 'numeric',
            'latitude'=> 'numeric',
            'longitude'=> 'numeric',
            //'fax'=> 'numeric',
            //'whatsapp'=> 'numeric',
        ]);

       // $checkbox = implode(",", $niveau_etude);

        if($request->photo){
            $name = time().'.' . explode('/', explode(':', substr($request->photo, 0, strpos($request->photo, ';')))[1])[1];
       
            \Image::make($request->photo)->resize(970, 796)->save(public_path('img/etablissement/').$name);
            
            $request->merge(['photo' => $name]);
        }
        else{
            $name = "default.png";
        }
        
        // return Etablissement::create([

        //     'categorie_id' => $request['categorie_id'],
        //     'user_id' => auth('api')->user()->id,
        //     'etablissement' => $request['etablissement'],
        //     'nom_contact' => $request['nom_contact'],
        //     'email' => $request['email'],
        //     'adresse' => $request['adresse'],
        //     'zone_id' => $request['zone_id'],
        //     'ville_id' => $request['ville_id'],
        //     'tel' => $request['tel'],
        //     'fax' => $request['fax'],
        //     'whatsapp' => $request['whatsapp'],
        //     'maps' => $request['maps'],
        //     'site_web' => $request['site_web'],
        //     'photo' => $name
        //     'mensualite_min' => $request['mensualite_min'],
        //     'mensualite_max' => $request['mensualite_max'],
        //     //'niveau_etude' => $checkbox,

        // ]);


        $etablissement = new Etablissement();

            $etablissement->categorie_id            = $request->categorie_id;
            $etablissement->user_id                 = auth('api')->user()->id;
            $etablissement->etablissement           = $request->etablissement;
            $etablissement->nom_contact             = $request->nom_contact;
            $etablissement->email                   = $request->email;
            $etablissement->adresse                 = $request->adresse;
            $etablissement->zone_id                 = $request->zone_id;
            $etablissement->ville_id                = $request->ville_id;
            $etablissement->latitude                = $request->latitude;
            $etablissement->longitude               = $request->longitude;
            $etablissement->tel                     = $request->tel;
            $etablissement->fax                     = $request->fax;
            $etablissement->whatsapp                = $request->whatsapp;
            $etablissement->maps                    = $request->maps;
            $etablissement->site_web                = $request->site_web;
            $etablissement->photo                   = $name;
            $etablissement->mensualite_min          = $request->mensualite_min;
            $etablissement->mensualite_max          = $request->mensualite_max;

        $etablissement->save();

        $etablissement->niveau_etudes()->attach($request->niveau_etude_id);

        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $etablissement = Etablissement::findOrFail($id);

        $currentPhoto = $etablissement->photo;

        if($request->photo != $currentPhoto){
            $name = time().'.' . explode('/', explode(':', substr($request->photo, 0, strpos($request->photo, ';')))[1])[1];

            \Image::make($request->photo)->resize(970, 796)->save(public_path('img/etablissement/').$name);
            $request->merge(['photo' => $name]);

            $etablissementPhoto = public_path('img/etablissement/').$currentPhoto;
            if(file_exists($etablissementPhoto)){
                @unlink($etablissementPhoto);
            }
        }

        $this->validate($request, [

            'zone_id' => 'required',
            'ville_id' => 'required',
            'categorie_id' => 'required',
            //'email' => 'required|email',
            'etablissement'=> 'required|min:3|max:255',
            'nom_contact'=> 'required|min:3',
            'tel'=> 'numeric',
            //'fax'=> 'numeric',
            //'whatsapp'=> 'numeric',

            'latitude'=> 'numeric',
            'longitude'=> 'numeric',

        ]);

        // $etablissement->update($request->all());

            $etablissement->categorie_id            = $request->categorie_id;
            $etablissement->user_id                 = auth('api')->user()->id;
            $etablissement->etablissement           = $request->etablissement;
            $etablissement->nom_contact             = $request->nom_contact;
            $etablissement->email                   = $request->email;
            $etablissement->adresse                 = $request->adresse;
            $etablissement->zone_id                 = $request->zone_id;
            $etablissement->ville_id                = $request->ville_id;
            $etablissement->latitude                = $request->latitude;
            $etablissement->longitude               = $request->longitude;
            $etablissement->tel                     = $request->tel;
            $etablissement->fax                     = $request->fax;
            $etablissement->whatsapp                = $request->whatsapp;
            $etablissement->maps                    = $request->maps;
            $etablissement->site_web                = $request->site_web;

            if($request->photo != $currentPhoto){
                $etablissement->photo       = $name;
            }

            $etablissement->mensualite_min  = $request->mensualite_min;
            $etablissement->mensualite_max  = $request->mensualite_max;

            $etablissement->save();

            //$niveaux = $request->input('niveau_etude_id');

            // $etab = Etablissement_niveau_etude::where('etablissement_id', $id)->get();

            // if($etab){
            //     Etablissement_niveau_etude::where('etablissement_id', $id)->delete();
            // }
            
            $etablissement->niveau_etudes()->detach();

            $etablissement->niveau_etudes()->attach($request->niveau_etude_id);
            // foreach($niveaux as $niveau){

            //     $nvs = new Etablissement_niveau_etude;
            //     $nvs->etablissement_id = $id;
            //     $nvs->niveau_etude_id = $niveau;
            //     $nvs->save();
                
            

            // }


        return ['message' => 'Etablissement modifié'];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->authorize('isAdminOrUser');
        
        $etablissement = Etablissement::findOrFail($id);
        $etablissement->delete();
        return ['message' => 'Etablissement Supprimé'];
    }

    public function search()
    {

        //select * from etablissements where `ville_id` in (select id from villes where ville = 'rabat')

        if ($search = \Request::get('q')){
            $etablissements = Etablissement::where(function($query) use ($search){
                $query->where('etablissement', 'LIKE', "'%$search%'")
                      ->orWhere('nom_contact', 'LIKE', "'%$search%'")
                      ->orWhere('tel', 'LIKE', "'%$search%'")
                      ->orWhere('whatsapp', 'LIKE', "'%$search%'")
                      ->orwhereIn('ville_id', function($query) use ($search){
                        $query->select('id')
                              ->from('villes')
                              ->where('ville', 'like', "'%$search%'");
                        });
            })

            ->paginate(10);

        }
        else{

            $etablissements = Etablissement::latest()
                ->with('zone')
                ->with('ville')
                ->with('categorie')
                ->paginate(10);
        }


        $villes = Ville::orderBy('ville','DESC')->get();
        $zones = Zone::orderBy('zone','DESC')->get();
        $categories = Categorie::orderBy('categorie','DESC')->get();
    
        return [
            'etablissements' => $etablissements,
            'villes' => $villes,
            'zones' => $zones,
            'categories' => $categories,
        ];


    }
}