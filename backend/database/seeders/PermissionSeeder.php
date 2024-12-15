<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;

class PermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $permissions = [
            'Crear cursos',
            'Leer cursos',
            'Actualizar cursos',
            'Eliminar cursos',
            'Ver dashboard',
            'Crear role',
            'Listar role',
            'Editar role',
            'Eliminar role',
            'Leer usuarios',
            'Editar usuarios'
        ];

        foreach ($permissions as $permission) {
            Permission::firstOrCreate(['name' => $permission]);
        }
    }
}
