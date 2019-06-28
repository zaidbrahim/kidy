<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGmapsGeocachesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('gmaps_geocaches', function (Blueprint $table) {
            $table->increments('id');
            $table->text('address');
            $table->string('latitude');
            $table->string('longitude');
            $table->string('infowindow_content');

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
        Schema::dropIfExists('gmaps_geocaches');
    }
}



