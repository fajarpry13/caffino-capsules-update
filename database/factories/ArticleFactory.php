<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class ArticleFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'title' => $this->faker->sentence(mt_rand(2,8)),
            'slug' => $this->faker->unique()->slug(),
            'content' => collect($this->faker->paragraphs(mt_rand(5,10)))->map(function($p){
                            return "<p>$p</p>";
                        })->implode(''),
            'user_id' => 1,
            'is_published' => 1,
            'published_at' => now()
        ];
    }
}
