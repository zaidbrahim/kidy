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

Route::get('/', 'IndexController@home')->name('index');
Route::get('/admin', 'HomeController@index')->name('home');
Route::get('/home', 'HomeController@index')->name('home');


Route::get('annuaire/{categorie?}','AnnuaireController@index')->name('annuaire');
Route::get('search','AnnuaireController@search')->name('search');

Route::get('get/zone', 'AnnuaireController@getZone')->name('zone.get');
Route::get('/getZones/{id}', 'AnnuaireController@getZones');


Route::get('{path}', "HomeController@index")->where('path', '([A-z\d-\/_.]+)?');