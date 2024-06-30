<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return ['Laravel' => app()->version()];
});


Route::get('/test-postgres', function () {
    try {
        DB::connection()->getPdo();
        echo "Conexão com o PostgreSQL estabelecida com sucesso!";
    } catch (\Exception $e) {
        die("Falha ao conectar ao PostgreSQL: " . $e->getMessage());
    }
});

require __DIR__.'/auth.php';
