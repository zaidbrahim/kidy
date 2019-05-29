<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::apiResources(['user' => 'API\UserController']);
Route::apiResources(['categorie' => 'API\CategorieController']);
Route::apiResources(['ville' => 'API\VilleController']);
Route::apiResources(['zone' => 'API\ZoneController']);
Route::apiResources(['etablissement' => 'API\EtablissementController']);

Route::get('profile', 'API\UserController@profile');
Route::put('profile', 'API\UserController@updateProfile');

Route::get('findUser', 'API\UserController@search');
Route::get('findCategorie', 'API\CategorieController@search');
Route::get('findVille', 'API\VilleController@search');
Route::get('findZone', 'API\ZoneController@search');
Route::get('findEtablissement', 'API\EtablissementController@search');