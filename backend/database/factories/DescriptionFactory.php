<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Factory as Faker; // Asegúrate de importar la clase Faker

class DescriptionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $faker = Faker::create('es_MX'); // Configurando Faker en español
        return [
            'name' =>$faker->sentence()
        ];
    }
}
