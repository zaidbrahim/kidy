<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEtablissementNiveauEtudeTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('etablissement_niveau_etude', function (Blueprint $table) {
            $table->integer('etablissement_id')->unsigned()->index();
            $table->foreign('etablissement_id')->references('id')->on('etablissements')->onDelete('cascade');
            $table->integer('niveau_etude_id')->unsigned()->index();
            $table->foreign('niveau_etude_id')->references('id')->on('niveau_etudes')->onDelete('cascade');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('etablissement_niveau_etude');
    }
}
