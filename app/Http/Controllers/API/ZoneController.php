<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Zone;
use App\Ville;

class ZoneController extends Controller
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
            
            $zones = Zone::latest()
                    ->with('ville')
                    ->paginate(10);

            return $zones;

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

            'zone' => 'required|string|max:191',
            'ville_id' => 'required'
        ]);

        
        return Zone::create([

            'ville_id' => $request['ville_id'],
            'zone' => $request['zone']
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
        $zone = Zone::findOrFail($id);

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
        $this->authorize('isAdmin');
        
        $zone = Zone::findOrFail($id);
        $zone->delete();
        return ['message' => 'Zone Supprimée'];
    }

    public function search()
    {
        if ($search = \Request::get('q')){
            $zones = Zone::where(function($query) use ($search){
                $query->where('zone', 'LIKE', "%$search%");
            })->paginate(10);
        }
        else{
            $zones = Zone::latest()->paginate(10);
        }

        return $zones;

    }
}
