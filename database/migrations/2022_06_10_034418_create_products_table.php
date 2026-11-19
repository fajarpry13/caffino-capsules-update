<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->integer('index')->nullable();
            $table->string('brand', 80);
            $table->string('name', 100);
            $table->string('slug');
            $table->string('icon', 100);
            $table->string('image', 100);
            $table->string('bg_color', 20);
            $table->text('description');
            $table->text('renteng_reguler');
            $table->text('pouch_reguler');
            $table->boolean('published')->unsigned()->default(0);
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
        Schema::dropIfExists('products');
    }
}
