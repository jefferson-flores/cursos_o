<?php
namespace App\Http\Controllers\Instructor;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Models\Course;
use App\Models\Level;
use App\Models\Price;
use Illuminate\Support\Str;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Support\Facades\DB;

class CourseController extends Controller
{
    public function __construct()
    {
        $this->middleware('can:Leer cursos')->only('index');
        $this->middleware('can:Crear cursos')->only('create', 'store');
        $this->middleware('can:Actualizar cursos')->only('edit', 'update', 'goals');
        $this->middleware('can:Eliminar cursos')->only('destroy');
    }

    use AuthorizesRequests;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $courses = Course::all();
        return response()->json($courses);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::pluck('name', 'id');
        $levels = Level::pluck('name', 'id');
        $prices = Price::pluck('name', 'id');

        return response()->json([
            'categories' => $categories,
            'levels' => $levels,
            'prices' => $prices
        ]);
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
            'title' => 'sometimes|string|max:255',
            'subtitle' => 'sometimes|string|max:255',
            'description' => 'sometimes|string',
            'status' => 'in:1,2,3',

            'level_id' => 'nullable|exists:levels,id',
            'category_id' => 'nullable|exists:categories,id',
            'price_id' => 'nullable|exists:prices,id',
        ]);
    
        $data = $request->all();
        // Generar el slug basado en el título
        $data['slug'] = Str::slug($data['title']);
        // Asignar el user_id automáticamente al usuario autenticado
        $data['user_id'] = auth()->id(); // Esto obtiene el ID del usuario autenticado

        $course = Course::create($data);
    
        return response()->json($course, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Course $course)
    {
        return response()->json($course);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Course $course)
    {
        $this->authorize('dicatated', $course);

        $categories = Category::pluck('name', 'id');
        $levels = Level::pluck('name', 'id');
        $prices = Price::pluck('name', 'id');

        return response()->json([
            'course' => $course,
            'categories' => $categories,
            'levels' => $levels,
            'prices' => $prices
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  Course $course
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Course $course)
{
    $this->authorize('dicatated', $course);

    $request->validate([
        'title' => 'sometimes|string|max:255',
        'subtitle' => 'sometimes|string|max:255',
        'description' => 'sometimes|string',
        'status' => 'in:1,2,3',

        'level_id' => 'nullable|exists:levels,id',
        'category_id' => 'nullable|exists:categories,id',
        'price_id' => 'nullable|exists:prices,id',
    ]);

    $data = $request->all();
    // Generar el slug basado en el título
    $data['slug'] = Str::slug($data['title']);
    // Asignar el user_id automáticamente al usuario autenticado
    $data['user_id'] = auth()->id(); // Esto obtiene el ID del usuario autenticado
    
    $course->update($data);

    return response()->json($course);
}

    /**
     * Remove the specified resource from storage.
     *
     * @param  Course $course
     * @return \Illuminate\Http\Response
     */
    /*public function destroy(Course $course)
{
    $deleted = Course::where('id', $course->id)->delete(); // Devuelve el número de filas afectadas
    if ($deleted) {
        return response()->json(['message' => 'Course deleted successfully.'], 200);
    }
    return response()->json(['message' => 'Failed to delete course.'], 400);
}*/

    /*public function destroy(Course $course)
    {
        //$this->authorize('dicatated', $course);

        $course->delete();

        return response()->json(['message' => 'Course deleted successfully.'], 200);
    }*/

        public function destroy(Course $course)
    {
        // Eliminar directamente usando una consulta SQL
        DB::delete('DELETE FROM public.courses WHERE id = ?', [$course->id]);

        return response()->json(['message' => 'Course deleted successfully.'], 200);
    }
    /**
     * Display the goals form.
     *
     * @param  Course $course
     * @return \Illuminate\Http\Response
     */
    public function goals(Course $course)
    {
        $this->authorize('dicatated', $course);

        return response()->json(['goals' => $course->goals]);
    }

    /**
     * Update the status of a course.
     *
     * @param  Course $course
     * @return \Illuminate\Http\Response
     */
    public function status(Course $course)
    {
        $course->status = 2;
        $course->save();

        return response()->json(['message' => 'Course status updated successfully.']);
    }

    /**
     * Show the observation form.
     *
     * @param  Course $course
     * @return \Illuminate\Http\Response
     */
    public function observation(Course $course)
    {
        return response()->json(['observation' => $course->observation]);
    }
}


/*
namespace App\Http\Controllers\Instructor;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Models\Course;
use App\Models\Level;
use App\Models\Price;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Support\Facades\Storage;
*/