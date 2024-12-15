<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Price;

class PriceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $prices = Price::all();
        return response()->json($prices); // Retorna la lista de precios como JSON
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return response()->json(['message' => 'Formulario de creación de precio']); // Mensaje indicando la acción
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
            'name' => 'required|unique:prices',
            'value' => 'required|numeric'
        ]);
        
        $price = Price::create($request->all());

        return response()->json(['message' => 'El precio se ha creado correctamente', 'price' => $price], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  Price  $price
     * @return \Illuminate\Http\Response
     */
    public function show(Price $price)
    {
        return response()->json($price); // Retorna los detalles del precio como JSON
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Price  $price
     * @return \Illuminate\Http\Response
     */
    public function edit(Price $price)
    {
        return response()->json($price); // Retorna los detalles del precio para editarlo
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  Price  $price
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Price $price)
    {
        $request->validate([
            'name' => 'required|unique:prices,name,' . $price->id,
            'value' => 'required|numeric'
        ]);
        
        $price->update($request->all());

        return response()->json(['message' => 'El precio se ha actualizado correctamente', 'price' => $price]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Price  $price
     * @return \Illuminate\Http\Response
     */
    public function destroy(Price $price)
    {
        $price->delete();
        
        return response()->json(['message' => 'El precio se ha eliminado correctamente']);
    }
}
