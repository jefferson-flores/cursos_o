<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Factory as Faker; // Asegúrate de importar la clase Faker

class LessonFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $faker = Faker::create('es_MX');
        return [
            'name' => $faker->sentence(),
            'url' => 'https://youtu.be/QwMlgfMK6fQ',
            'iframe' => '<iframe width="560" height="315" src="https://www.youtube.com/embed/QwMlgfMK6fQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>',
            'platform_id' => 1
        ];
    }
}
