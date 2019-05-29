<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEtablissementsTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('etablissements', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id')->unsigned()->nullable();
            $table->foreign('user_id')->references('id')->on('users');
            $table->integer('categorie_id')->unsigned()->nullable();
            $table->foreign('categorie_id')->references('id')->on('categories');
            $table->string('nom_contact');
            $table->string('email');
            $table->string('etablissement');
            $table->string('adresse');
            $table->integer('zone_id')->unsigned()->nullable();
            $table->foreign('zone_id')->references('id')->on('zones');
            $table->integer('ville_id')->unsigned()->nullable();
            $table->foreign('ville_id')->references('id')->on('villes');
            $table->string('tel')->nullable();
            $table->string('fax')->nullable();
            $table->string('whatsapp')->nullable();
            $table->string('maps')->nullable();
            $table->string('photo')->default('default.png');
            $table->string('site_web')->nullable();
            $table->string('mensualite_min')->nullable();
            $table->string('mensualite_max')->nullable();
            $table->string('niveau_etude')->nullable();
            $table->timestamps();
            $table->softDeletes();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('etablissements');
    }
}
