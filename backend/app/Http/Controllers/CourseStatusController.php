<?php

namespace App\Http\Controllers;

use App\Models\Course;
use Illuminate\Http\Request;

class CourseStatusController extends Controller
{
    public function show($id)
    {
        // Cargar el curso con relaciones necesarias
        $course = Course::with('category', 'level', 'price', 'goals', 'requirements', 'sections.lessons', 'students')
            ->findOrFail($id);

        // Verificar si el usuario está autenticado e inscrito
        $isEnrolled = auth()->check() && $course->students->contains(auth()->user()->id);

        return response()->json([
            'course' => $course,
            'isEnrolled' => $isEnrolled,
        ]);
    }
}

