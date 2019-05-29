<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Etablissement;
use App\Zone;
use App\Ville;

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
            return $etablissements;
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

            'type' => 'required|max:255',
            //'email' => 'required|email',
            'etablissement'=> 'required|min:3|max:255',
            'nom_contact'=> 'required|min:3',
            'tel'=> 'numeric',
            //'fax'=> 'numeric',
            //'whatsapp'=> 'numeric',
        ]);

        $niveau_etude = $request->get('niveau_etude');
        $checkbox = implode(",", $niveau_etude);

        $name = time().'.' . explode('/', explode(':', substr($request->photo, 0, strpos($request->photo, ';')))[1])[1];
       
        \Image::make($request->photo)->save(public_path('img/etablissement/').$name);
        $request->merge(['photo' => $name]);

       
    
        
        return Etablissement::create([

            'categorie_id' => $request['type'],
            'user_id' => auth('api')->user()->id,
            'etablissement' => $request['etablissement'],
            'nom_contact' => $request['nom_contact'],
            'email' => $request['email'],
            'adresse' => $request['adresse'],
            'zone_id' => $request['zone_id'],
            'ville_id' => $request['ville_id'],
            'tel' => $request['tel'],
            'fax' => $request['fax'],
            'whatsapp' => $request['whatsapp'],
            'maps' => $request['maps'],
            'site_web' => $request['site_web'],
            'photo' => $name,
            'mensualite_min' => $request['mensualite_min'],
            'mensualite_max' => $request['mensualite_max'],
            'niveau_etude' => $checkbox,

        ]);
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
        $zone = Etablissement::findOrFail($id);

        $this->validate($request, [

            'zone' => 'required|string|max:191',
            'ville_id' => 'required',

        ]);

        $zone->update($request->all());

        return ['message' => 'Zone modifiée'];
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
        
        $zone = Etablissement::findOrFail($id);
        $zone->delete();
        return ['message' => 'Zone Supprimée'];
    }

    public function search()
    {
        if ($search = \Request::get('q')){
            $etablissements = Etablissement::where(function($query) use ($search){
                $query->where('zone', 'LIKE', "%$search%");
            })->paginate(10);
        }
        else{
            $etablissements = Etablissement::latest()->paginate(10);
        }

        return $etablissements;

    }
}