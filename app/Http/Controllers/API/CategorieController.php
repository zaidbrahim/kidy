<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Categorie;

class CategorieController extends Controller
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
            return Categorie::latest()->paginate(10);
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

            'categorie' => 'required|string|max:191'
        ]);
        
        
        return Categorie::create([

            'categorie' => $request['categorie'],
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
        $categorie = Categorie::findOrFail($id);

        $this->validate($request, [

            'categorie' => 'required|string|max:191|unique:categories,categorie,'.$categorie->id,

        ]);

        $categorie->update($request->all());

        return ['message' => 'Updating Category'];
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
        
        $categorie = Categorie::findOrFail($id);
        $categorie->delete();
        return ['message' => 'Category deleted'];
    }

    public function search()
    {
        if ($search = \Request::get('q')){
            $categories = Categorie::where(function($query) use ($search){
                $query->where('categorie', 'LIKE', "%$search%");
            })->paginate(10);
        }
        else{
            $categories = Categorie::latest()->paginate(10);
        }

        return $categories;

    }
}
