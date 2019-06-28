<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnsVilleIdZoneIdToGmapsGeocachesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('gmaps_geocaches', function (Blueprint $table) {

            $table->integer('ville_id')->unsigned()->nullable()->after('id');
            $table->foreign('ville_id')->references('id')->on('villes');
            $table->integer('zone_id')->unsigned()->nullable()->before('address');
            $table->foreign('zone_id')->references('id')->on('zones');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('gmaps_geocaches', function (Blueprint $table) {
            $table->dropColumn('ville_id');
            $table->dropColumn('zone_id');
        });
    }
}
