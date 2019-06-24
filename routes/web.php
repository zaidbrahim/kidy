<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('invoice', function(){
    return view('invoice');
});

Auth::routes();

//Route::get('getData', array('as'=>'myform', 'uses'=>'IndexController@getData'));
Route::get('getZones/{id}', array('as'=>'getZones', 'uses'=>'IndexController@getZones'));



Route::get('/', 'IndexController@home')->name('index');
Route::get('/admin', 'HomeController@index')->name('home');
Route::get('/home', 'HomeController@index')->name('home');


Route::get('/annuaire','AnnuaireController@index')->name('annuaire.index');
Route::get('/annuaire/categories/{categorie?}','AnnuaireController@getCategories')->name('annuaire.categorie');
Route::get('/annuaire/villes/{ville?}','AnnuaireController@getVilles')->name('annuaire.ville');
Route::get('/search','AnnuaireController@search')->name('search');

//Route::get('/get/zone', 'AnnuaireController@getZone')->name('zone.get');
//Route::get('/getZones/{id}', 'AnnuaireController@getZones');


Route::get('{path}', "HomeController@index")->where('path', '([A-z\d-\/_.]+)?');