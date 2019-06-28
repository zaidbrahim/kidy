<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Ville;

class VilleController extends Controller
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
        if (\Gate::allows('isAdmin') || \Gate::allows('isUser')) {
            return Ville::latest()->paginate(10);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [

            'ville' => 'required|string|max:191'
        ]);


        return Ville::create([

            'ville' => $request['ville'],
            'latitude' => $request['latitude'],
            'longitude' => $request['longitude'],
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $ville = Ville::findOrFail($id);


        $this->validate($request, [

            'ville' => 'required|string|max:191|unique:villes,ville,' . $ville->id,

        ]);

        $ville->update($request->all());

        return ['message' => 'Villemodifiée'];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->authorize('isAdmin');

        $ville = Ville::findOrFail($id);
        $ville->delete();
        return ['message' => 'City deleted'];
    }

    public function search()
    {
        if ($search = \Request::get('q')) {
            $villes = Ville::where(function ($query) use ($search) {
                $query->where('ville', 'LIKE', "%$search%");
            })->paginate(10);
        } else {
            $villes = Ville::latest()->paginate(10);
        }

        return $villes;

    }
}
