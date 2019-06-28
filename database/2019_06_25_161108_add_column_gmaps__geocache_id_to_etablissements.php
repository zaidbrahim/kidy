<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnGmapsGeocacheIdToEtablissements extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('etablissements', function (Blueprint $table) {
            $table->integer('gmaps_geocache_id')->unsigned()->nullable()->after('ville_id');
            $table->foreign('gmaps_geocache_id')->references('id')->on('gmaps_geocaches');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('etablissements', function (Blueprint $table) {
            $table->dropColumn('gmaps_geocache_id');
        });
    }
}
