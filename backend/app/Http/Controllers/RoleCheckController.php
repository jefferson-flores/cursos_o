<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class RoleCheckController extends Controller
{
    /**
     * Verificar si el usuario autenticado tiene el rol de Admin o Instructor.
     */
    public function checkRole()
    {
        // Obtener el ID del usuario autenticado
        $userId = Auth::id();

        // Consultar si el usuario tiene los roles requeridos
        $hasRole = DB::table('users')
            ->join('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
            ->join('roles', 'roles.id', '=', 'model_has_roles.role_id')
            ->where('users.id', $userId)
            ->whereIn('roles.name', ['Admin', 'Instructor'])
            ->exists();

        if ($hasRole) {
            // Responder con acceso permitido
            return response()->json([
                'success' => true,
                'message' => 'Acceso permitido.',
            ]);
        }

        // Responder con acceso denegado
        return response()->json([
            'success' => false,
            'message' => 'No tienes acceso a esta sección.',
        ], 403);
    }
}
