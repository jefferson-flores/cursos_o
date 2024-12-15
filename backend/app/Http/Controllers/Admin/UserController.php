<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:Leer usuarios')->only('index');
        $this->middleware('can:Editar usuarios')->only('edit', 'update');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::with('roles')->get(); // Obtener los usuarios con sus roles
        return response()->json($users); // Retornar la lista de usuarios como JSON
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $roles = Role::all(); // Obtener todos los roles disponibles
        return response()->json($roles); // Retornar los roles disponibles como JSON
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
            'roles' => 'required|array',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
        ]);

        // Asignar roles al usuario
        $user->roles()->sync($request->roles);

        return response()->json(['message' => 'Usuario creado exitosamente', 'user' => $user], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        return response()->json($user); // Retornar los detalles del usuario como JSON
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        $roles = Role::all(); // Obtener todos los roles
        return response()->json(['user' => $user, 'roles' => $roles]); // Retornar el usuario y roles como JSON
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        try {
        $request->validate([
            'roles' => 'required|array',
        ]);

        $user->roles()->sync($request->roles); // Sincronizar los roles del usuario

        return response()->json(['message' => 'Usuario actualizado exitosamente', 'user' => $user]);
        
             } catch (\Exception $e) {
        return response()->json([
            'message' => 'Error al actualizar el usuario',
            'error' => $e->getMessage(),
        ], 500);
    }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        $user->delete(); // Eliminar el usuario

        return response()->json(['message' => 'Usuario eliminado exitosamente']);
    }
}
