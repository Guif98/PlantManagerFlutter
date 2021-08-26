<?php

namespace App\Http\Controllers;

use App\Models\Plant;
use Illuminate\Http\Request;

class PlantController extends Controller
{
    public function index() {
        return Plant::all();
    }

    public function show(Plant $plant) {
        return $plant;
    }

    public function store(Request $request) {
        $plant = Plant::create($request->all());
        return response()->json($plant, 201);
    }
}
