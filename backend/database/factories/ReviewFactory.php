<?php

namespace Database\Factories;

use App\Models\Review;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Factory as Faker; // Asegúrate de importar la clase Faker

class ReviewFactory extends Factory
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
           'comment' => $faker->text(),
           'rating' => $this->faker->randomElement([3,4,5]),
           'user_id' => User::all()->random()->id
        ];
    }
}
