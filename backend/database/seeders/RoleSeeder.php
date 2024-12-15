<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;


class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Crear el rol de Admin y sincronizar todos los permisos
        $adminRole = Role::firstOrCreate(['name' => 'Admin']);
        $allPermissions = Permission::all();
        $adminRole->syncPermissions($allPermissions);

        // Crear el rol de Instructor y sincronizar permisos específicos
        $instructorRole = Role::firstOrCreate(['name' => 'Instructor']);
        $instructorPermissions = Permission::whereIn('name', [
            'Crear cursos',
            'Leer cursos',
            'Actualizar cursos',
            'Eliminar cursos'
        ])->get();
        $instructorRole->syncPermissions($instructorPermissions);
    }
}
