<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Models\Plant;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('anajulia', function() {
    return response()->json(['Chatuba come cu' => 'E depois come xereca']);
});
Route::get('/plant', 'PlantController@index');
Route::get('/plant/id', 'PlantController@show');
Route::post('/plant', 'PlantController@store');