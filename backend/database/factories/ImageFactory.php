<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Factory as Faker; // Asegúrate de importar la clase Faker

class ImageFactory extends Factory
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
            'url'=> 'courses/'. $faker->image('public/storage/courses', 640 , 480, null, false), // storage\app\cursos
          
        ];
    }
}
