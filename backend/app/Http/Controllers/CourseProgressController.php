<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Lesson;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class CourseProgressController extends Controller
{
    public function show($id)
    {
        $course = Course::with('lessons')->findOrFail($id);

        // Comprobar si el usuario está autenticado e inscrito
        $this->authorize('enrolled', $course);

        // Encontrar la lección actual
        $currentLesson = $course->lessons->firstWhere('completed', false) ?? $course->lessons->last();

        $progress = $this->calculateProgress($course);

        return response()->json([
            'course' => $course,
            'currentLesson' => $currentLesson,
            'progress' => $progress,
            'previousLesson' => $this->getPreviousLesson($course, $currentLesson),
            'nextLesson' => $this->getNextLesson($course, $currentLesson),
        ]);
    }

   
    public function toggleCompletion($lessonId)
    {
        $lesson = Lesson::findOrFail($lessonId);
    
        // Verificar si el usuario ya completó la lección
        $isCompleted = $lesson->users()->where('user_id', Auth::id())->exists();
    
        if ($isCompleted) {
            $lesson->users()->detach(Auth::id());
        } else {
            $lesson->users()->attach(Auth::id());
        }
    
        // Verificar que la lección tenga un curso asociado
        $course = $lesson->course;
        if (!$course) {
            return response()->json(['error' => 'El curso asociado no se encontró.'], 404);
        }
    
        // Retornar la respuesta con el progreso actualizado
        return response()->json([
            'lesson' => $lesson->refresh(),
            'progress' => $this->calculateProgress($course),
        ]);
    }
    

        public function getLesson($lessonId)
    {
        $lesson = Lesson::with('course')->findOrFail($lessonId);
        
        // Devolver la lección como respuesta JSON, incluyendo el curso
        return response()->json($lesson);
    }


    private function calculateProgress(Course $course)
    {
        $completedLessons = $course->lessons->where('completed', true)->count();
        $totalLessons = $course->lessons->count();
        $progress = ($totalLessons > 0) ? ($completedLessons / $totalLessons) * 100 : 0;

        return round($progress, 2) . '%';
    }

    private function getPreviousLesson(Course $course, Lesson $currentLesson)
    {
        $index = $course->lessons->pluck('id')->search($currentLesson->id);

        return $index > 0 ? $course->lessons[$index - 1] : null;
    }

    private function getNextLesson(Course $course, Lesson $currentLesson)
    {
        $index = $course->lessons->pluck('id')->search($currentLesson->id);

        return $index < ($course->lessons->count() - 1) ? $course->lessons[$index + 1] : null;
    }
}
