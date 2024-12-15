<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use GuzzleHttp\Promise\Create;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //crear user
        $user = User::create([
                    'name' => 'fau',
                    'email' => 'faubla111@gmail.com',
                    'password' => bcrypt('hola123')
                ]);
        $user->assignRole('Admin');
        //creación 99 registros con datos de prueba utilizando factory
        User::factory(99)->create();
    }
}
