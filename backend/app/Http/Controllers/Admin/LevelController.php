<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Level;

class LevelController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $levels = Level::all();
        return response()->json($levels); // Devuelve la lista de niveles como JSON
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return response()->json(['message' => 'Formulario para crear un nivel']); // Mensaje indicando la acción
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
            'name' => 'required|unique:levels'
        ]);
        
        $level = Level::create($request->all());

        return response()->json(['message' => 'Nivel creado correctamente', 'level' => $level], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  Level  $level
     * @return \Illuminate\Http\Response
     */
    public function show(Level $level)
    {
        return response()->json($level); // Devuelve los detalles del nivel como JSON
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Level  $level
     * @return \Illuminate\Http\Response
     */
    public function edit(Level $level)
    {
        return response()->json($level); // Devuelve los detalles del nivel para editarlo
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  Level  $level
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Level $level)
    {
        $request->validate([
            'name' => 'required|unique:levels,name,' . $level->id
        ]);
        
        $level->update($request->all());

        return response()->json(['message' => 'Nivel actualizado correctamente', 'level' => $level]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Level  $level
     * @return \Illuminate\Http\Response
     */
    public function destroy(Level $level)
    {
        $level->delete();
        
        return response()->json(['message' => 'Nivel eliminado correctamente']);
    }
}
