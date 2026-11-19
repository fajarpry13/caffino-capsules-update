<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePageDetailTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('page_detail', function (Blueprint $table) {
            $table->id();
            $table->foreignId('page_id')->references('id')->on('pages')->unsigned()->nullable();
            $table->integer('index')->nullable();
            $table->string('code', 100);
            $table->string('lable', 100);
            $table->enum('type', ['text', 'texteditor', 'textarea', 'file']);
            $table->text('value');
            $table->string('helper');
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
        Schema::dropIfExists('page_detail');
    }
}
