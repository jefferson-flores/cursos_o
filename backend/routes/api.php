<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsuarioController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\CourseStatusController;
use App\Http\Controllers\CourseProgressController;
use App\Http\Controllers\Instructor\CourseController as InstructorCourseController;
use App\Http\Controllers\Admin\LevelController;
use App\Http\Controllers\Admin\CourseController as AdminCourseController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\RoleController as AdminRoleController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\PriceController;
use App\Http\Controllers\Admin\HomeController as AdminHomeController;
use App\Http\Controllers\RoleCheckController;
use Illuminate\Support\Facades\DB;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/login', [AuthController::class, 'login']);

Route::post('/register', [AuthController::class, 'register']);

Route::middleware('auth:sanctum')->group(function(){
    Route::get('/user-profile', [AuthController::class, 'profile']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/user', [AuthController::class, 'index']);

    // Rutas protegidas para usuarios
    Route::get('/user', [UsuarioController::class,'index']);          // Obtener total de usuarios
    Route::get('/user/{id}', [UsuarioController::class,'registroUser']); // Buscar usuario por ID
    Route::post('/user', [UsuarioController::class,'store']);         // Registrar un nuevo usuario
    Route::put('/user/{id}', [UsuarioController::class, 'update']);   // Actualizar usuario por ID
    Route::delete('/user/{id}', [UsuarioController::class, 'destroy']); // Eliminar usuario por ID


    //Ruta para los cursos
    //Muestra todos los cursos
    Route::get('/cursos',[CourseController::class, 'index'])->middleware('auth');
    //Muestra la Inscripcion a un curso
    Route::post('courses/{course:slug}/enrolled', [CourseController::class, 'enrolled'])->middleware('auth')->name('courses.enrolled');
    //Muestra los cursos del usuario
    Route::get('/course-miscursos',[CourseController::class, 'miscursos'])->middleware('auth');
    //Route::get('/courses/{course}', [CourseController::class, 'show'])->middleware('auth');

    // Ruta para mostrar el progreso de un curso específico
    Route::get('/progress/{id}', [CourseProgressController::class, 'show'])->middleware('auth');
    
    // Ruta para marcar o desmarcar una lección como completada
    Route::post('/lessons/{lessonId}/toggle-completion', [CourseProgressController::class, 'toggleCompletion'])->middleware('auth');
    
    // Ruta para obtener los detalles de una lección
    Route::get('/lessons/{id}', [CourseProgressController::class, 'getLesson'])->middleware('auth');


    //Rutas para crear cursos
    Route::apiResource('coursess', InstructorCourseController::class);
  
});


Route::middleware('auth:sanctum')->get('/check-role', [RoleCheckController::class, 'checkRole']);

/*Route::middleware(['auth', 'role:Admin|Instructor'])->group(function () {
    Route::apiResource('coursess', InstructorCourseController::class);
});*/

//Rutas para el Admin
Route::prefix('admin/courses')->middleware('auth:sanctum')->group(function () {
    Route::get('/', [AdminCourseController::class, 'index']); // Obtener todos los cursos con estado "pendiente"
    Route::get('{course}', [AdminCourseController::class, 'show']); // Obtener detalles de un curso específico
    Route::post('{course}/approved', [AdminCourseController::class, 'approved']); // Aprobar un curso
    Route::post('{course}/reject', [AdminCourseController::class, 'reject']); // Rechazar un curso
    Route::get('{course}/observation', [AdminCourseController::class, 'observation']); // Ver observaciones del curso
});
Route::prefix('admin/categories')->middleware('auth:sanctum')->group(function () {
    Route::get('/', [CategoryController::class, 'index']); // Obtener todas las categorías
    Route::post('/', [CategoryController::class, 'store']); // Crear una nueva categoría
    Route::get('{category}', [CategoryController::class, 'show']); // Mostrar una categoría específica
    Route::put('{category}', [CategoryController::class, 'update']); // Actualizar una categoría específica
    Route::delete('{category}', [CategoryController::class, 'destroy']); // Eliminar una categoría específica
});
Route::prefix('admin/levels')->middleware('auth:sanctum')->group(function () {
    Route::get('/', [LevelController::class, 'index']);  // Obtener todos los niveles
    Route::post('/', [LevelController::class, 'store']); // Crear un nuevo nivel
    Route::get('{level}', [LevelController::class, 'show']); // Mostrar un nivel específico
    Route::put('{level}', [LevelController::class, 'update']); // Actualizar un nivel específico
    Route::delete('{level}', [LevelController::class, 'destroy']); // Eliminar un nivel específico
});

// Rutas para RoleController
//Route::resource('roles', RoleController::class)->except(['create', 'edit']);
/*Route::get('roles', function () {
    return response()->json(Role::all());
});*/
// Rutas para UserController
/*Route::middleware('auth:sanctum')->group(function () {
    Route::get('users', [UserController::class, 'index']);
    Route::post('users', [UserController::class, 'store']);
    Route::get('users/{user}', [UserController::class, 'show']);
    Route::get('users/{user}/edit', [UserController::class, 'edit']);
    Route::put('users/{user}', [UserController::class, 'update']);
    Route::delete('users/{user}', [UserController::class, 'destroy']);
});*/
Route::middleware('auth:sanctum')->get('/users', function () {
    return App\Models\User::all();
});

// Rutas para PriceController
Route::middleware(['auth:sanctum'])->resource('prices', PriceController::class)->except(['create', 'edit']);

// Rutas para LevelController
Route::middleware(['auth:sanctum'])->resource('levels', LevelController::class)->except(['create', 'edit']);

// Ruta para HomeController
Route::middleware(['auth:sanctum'])->get('/home', [HomeController::class, 'index']);


// routes/web.php
//Ruta donde se ve los cursos principales
Route::get('/courses', [HomeController::class, '__invoke']);    
//Route::get('/course-status/{course}', CourseStatus::class)->name('courses.status');
//Detalles del curso
Route::get('/courses-status/{id}', [CourseStatusController::class, 'show']);



