<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Course;
use App\Models\Review;
use Illuminate\Auth\Access\HandlesAuthorization;

class CoursePolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }
    public function enrolled(User $user, Course $course)
    {
        //verificar si un  usuario está matriculado
        return $course->students->contains($user->id);
    }
    public function published(?User $user, Course $course)
    { //protección ruta status 3
        if ($course->status == 3) {
            return true;
        } else {
            return false;
        }
    }

    public function dicatated(User $user, Course $course)
    {
        \Log::info("Verificando autorización para el usuario {$user->id} en el curso {$course->id}");
        \Log::info("El usuario autenticado: {$user->id}, ID del propietario del curso: {$course->user_id}");
        if ($course->user_id == $user->id) {
            return true;
        } else {
            return false;
        }
    }
    public function revision(User $user, Course $course)
    {
        if ($course->status == 2) {
            return true;
        } else {
            false;
        }
    }

    public function valued(User $user, Course $course)
    {
        if (Review::where('user_id', $user->id)->where('course_id', $course->id)->count()) {
            return false;
        } else {
            return true;
        }
    }
}
