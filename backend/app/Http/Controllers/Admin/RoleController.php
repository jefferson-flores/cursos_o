<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RoleController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:Listar role')->only('index');
        $this->middleware('can:Crear role')->only('create', 'store');
        $this->middleware('can:Editar role')->only('edit', 'update');
        $this->middleware('can:Eliminar role')->only('destroy');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $roles = Role::all();
        return response()->json($roles); // Retorna los roles en formato JSON
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $permissions = Permission::all();
        return response()->json($permissions); // Retorna los permisos en formato JSON
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Recoge la info del formulario
        $request->validate([
            'name' => 'required',
            'permissions' => 'required'
        ]);

        $role = Role::create([
            'name' => $request->name
        ]);
        $role->permissions()->attach($request->permissions);

        return response()->json([
            'message' => 'El Rol ha sido creado satisfactoriamente',
            'role' => $role
        ], 201); // Respuesta exitosa con el nuevo rol
    }

    /**
     * Display the specified resource.
     *
     * @param  Role  $role
     * @return \Illuminate\Http\Response
     */
    public function show(Role $role)
    {
        return response()->json($role); // Retorna el rol especificado en formato JSON
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Role  $role
     * @return \Illuminate\Http\Response
     */
    public function edit(Role $role)
    {
        $permissions = Permission::all();
        return response()->json([
            'role' => $role,
            'permissions' => $permissions
        ]); // Retorna el rol y los permisos en formato JSON
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  Role  $role
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Role $role)
    {
        $request->validate([
            'name' => 'required',
            'permissions' => 'required'
        ]);
        
        $role->update([
            'name' => $request->name
        ]);
        $role->permissions()->sync($request->permissions); // sync elimina los permisos y los vuelve a llenar

        return response()->json([
            'message' => 'El rol ha sido actualizado satisfactoriamente',
            'role' => $role
        ]); // Retorna el rol actualizado en formato JSON
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Role  $role
     * @return \Illuminate\Http\Response
     */
    public function destroy(Role $role)
    {
        $role->delete();
        return response()->json([
            'message' => 'El rol se ha eliminado correctamente'
        ]); // Respuesta exitosa de eliminación
    }
}
