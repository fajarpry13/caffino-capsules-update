<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLinkSosmedTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('link_sosmed', function (Blueprint $table) {
            $table->id();
            $table->string('link_instagram', 100);
            $table->string('link_tiktok', 100);
            $table->string('link_facebook', 100);
            $table->string('link_youtube', 100);
            $table->string('link_twitter', 100);
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
        Schema::dropIfExists('link_sosmed');
    }
}
