<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Course;
use Illuminate\Support\Facades\Mail;
use App\Mail\ApprovedCourse;
use App\Mail\RejectCourse;

class CourseController extends Controller
{
    /**
     * Display a listing of the courses with status 2 (pending review).
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $courses = Course::where('status', 2)->paginate();
        return response()->json(['courses' => $courses]);
    }

    /**
     * Show the specified course for review.
     *
     * @param  \App\Models\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function show(Course $course)
    {
        $this->authorize('revision', $course);

        return response()->json(['course' => $course]);
    }

    /**
     * Approve the course if all required fields are complete.
     *
     * @param  \App\Models\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function approved(Course $course)
    {
        $this->authorize('revision', $course);

        // Check if all required fields are filled
        if (!$course->lessons || !$course->goals || !$course->requirements || !$course->image) {
            return response()->json(['message' => 'No se puede publicar un curso sin estar completo. Asegúrate de que todos los campos requeridos estén llenos.'], 400);
        }

        // Update the course status to approved (3)
        $course->status = 3;
        $course->save();

        // Send approval email
        $mail = new ApprovedCourse($course);
        Mail::to($course->teachers->email)->queue($mail); // Use queue for background sending

        return response()->json(['message' => 'El curso se ha publicado correctamente.']);
    }

    /**
     * Show the form for adding observations to the course.
     *
     * @param  \App\Models\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function observation(Course $course)
    {
        return response()->json(['course' => $course]);
    }

    /**
     * Reject the course and send the teacher a rejection email.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function reject(Request $request, Course $course)
    {
        // Validate the observation field
        $request->validate([
            'body' => 'required',
        ]);

        // Store the rejection observation
        $course->observation()->create($request->all());

        // Update the course status to rejected (1)
        $course->status = 1;
        $course->save();

        // Send rejection email
        $mail = new RejectCourse($course);
        Mail::to($course->teachers->email)->queue($mail); // Use queue for background sending

        return response()->json(['message' => 'El curso ha sido rechazado por parte del Administrador.']);
    }
}
