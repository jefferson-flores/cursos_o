<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Course;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class CourseController extends Controller
{
    public function index(Request $request)
    {
        $limit = $request->get('limit', 10);
        $page = $request->get('page', 1);
        $offset = ($page - 1) * $limit;
    
        $courses = Course::skip($offset)->take($limit)->get();
        $total = Course::count(); // Total de cursos
    
        return response()->json([
            'featuredCourses' => $courses->take(3), // Cambia según la lógica de destacados
            'otherCourses' => $courses->skip(3), // Cursos restantes
            'total' => $total // Total de cursos
        ]);
    }

    public function show(Course $course)
    {
        // Asegúrate de que el curso existe
        if (!$course) {
            return response()->json(['error' => 'Curso no encontrado'], 404);
        }
    
        $this->authorize('published', $course);
    
        // Obtener cursos similares
        $similares = Course::where('category_id', $course->category_id)
            ->where('id', '!=', $course->id)
            ->where('status', 3)
            ->latest('id')
            ->take(5)
            ->get();
    
        return response()->json([
            'course' => $course,
            'similarCourses' => $similares,
        ]);
    }
    
    
    

    public function enrolled(Course $course)
    {
        $user = auth()->user();

        if ($course->students()->where('user_id', $user->id)->exists()) {
            return response()->json(['message' => 'Ya estás inscrito en este curso.'], 400);
        }

        $course->students()->attach($user->id);

        return response()->json(['message' => 'Inscripción exitosa'], 200);
    }

    // Método para devolver cursos inscritos del usuario en formato JSON para el frontend en Vue.js
    public function miscursos()
    {
        $user = auth()->user();

        $coursesUser = DB::table('course_user')
        ->Join('users', 'users.id', '=', 'course_user.user_id')
        ->Join('courses', 'courses.id', '=', 'course_user.course_id')
        ->where('users.id', '=', auth()->user()->id)
        ->select('courses.*')
        ->get();

        // Retorna los cursos en formato JSON
        return response()->json($coursesUser);
    }
}

// // 