<template>
  <div class="course-management">
    <h1 class="text-center mb-5">Gestión de Cursos</h1>

    <!-- Formulario para crear/editar curso dentro de un panel (card) -->
    <div class="card shadow-sm mb-4">
      <div class="card-header bg-primary text-white">
        <h4 class="mb-0">{{ editing ? "Editar Curso" : "Crear Nuevo Curso" }}</h4>
      </div>
      <div class="card-body">
        <form @submit.prevent="handleSubmit">
          <div class="mb-3">
            <label for="title" class="form-label">Título</label>
            <input type="text" v-model="form.title" id="title" class="form-control" required />
          </div>

          <div class="mb-3">
            <label for="subtitle" class="form-label">Subtítulo</label>
            <input type="text" v-model="form.subtitle" id="subtitle" class="form-control" required />
          </div>

          <div class="mb-3">
            <label for="description" class="form-label">Descripción</label>
            <textarea v-model="form.description" id="description" class="form-control" rows="3" required></textarea>
          </div>

          <div class="mb-3">
            <label for="status" class="form-label">Estado</label>
            <select
              v-model="form.status"
              id="status"
              class="form-control"
              required
            >
              <option :value="1">Activo</option>
              <option :value="0">Inactivo</option>
            </select>
          </div>


          <div class="mb-3">
            <label for="level_id" class="form-label">Nivel</label>
            <input
              type="number"
              v-model="form.level_id"
              id="level_id"
              class="form-control"
              required
            />
          </div>

          <div class="mb-3">
            <label for="category_id" class="form-label">Categoría</label>
            <input
              type="number"
              v-model="form.category_id"
              id="category_id"
              class="form-control"
              required
            />
          </div>

          <div class="mb-3">
            <label for="price_id" class="form-label">Precio</label>
            <input
              type="number"
              v-model="form.price_id"
              id="price_id"
              class="form-control"
              required
            />
          </div>

          <button type="submit" class="btn btn-success w-100">{{ editing ? "Actualizar Curso" : "Crear Curso" }}</button>
        </form>
      </div>
    </div>

    <!-- Listado de cursos dentro de un panel -->
    <div class="card shadow-sm">
      <div class="card-header bg-info text-white">
        <h4 class="mb-0">Lista de Cursos</h4>
      </div>
      <div class="card-body">
        <ul class="list-group">
          <li v-for="course in courses" :key="course.id" class="list-group-item d-flex justify-content-between align-items-center">
            <strong>{{ course.title }}</strong> - {{ course.subtitle }}
            <div>
              <button @click="editCourse(course)" class="btn btn-warning btn-sm mx-1">Editar</button>
              <button @click="deleteCourse(course.id)" class="btn btn-danger btn-sm mx-1">Eliminar</button>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      courses: [], // Lista de cursos
      form: {
        title: '',
        subtitle: '',
        description: '',
        slug: '',
        user_id: '',
        level_id: '',
        category_id: '',
        price_id: '',
        status: 1
      },
      editing: false, // Indica si estamos editando un curso
      currentCourseId: null, // ID del curso actual
    };
  },
  methods: {
    // Cargar los cursos
    async fetchCourses() {
      try {
        const token = localStorage.getItem('token'); // Obtener el token del localStorage
        const headers = {
          Authorization: `Bearer ${token}`, // Incluir el token en los encabezados
        };

        const response = await axios.get('http://localhost:8000/api/coursess', { headers });
        this.courses = response.data;
      } catch (error) {
        console.error('Error al cargar los cursos:', error);
      }
    },

    // Crear o actualizar un curso
    async handleSubmit() {
      try {
        const token = localStorage.getItem('token'); // Obtener el token del localStorage
        const headers = {
          Authorization: `Bearer ${token}`, // Incluir el token en los encabezados
        };

        if (this.editing) {
          // Actualizar curso
          await axios.put(`http://localhost:8000/api/coursess/${this.currentCourseId}`, this.form, { headers });
          alert('Curso actualizado con éxito');
        } else {
          // Crear curso
          await axios.post('http://localhost:8000/api/coursess', this.form, { headers });
          alert('Curso creado con éxito');
        }

        this.resetForm();
        this.fetchCourses(); // Recargar lista de cursos
      } catch (error) {
        console.error('Error al guardar el curso:', error);
      }
    },

    // Preparar el formulario para editar un curso
    editCourse(course) {
      this.editing = true;
      this.currentCourseId = course.id;
      this.form = { ...course }; // Cargar datos en el formulario
    },

    // Eliminar un curso
    async deleteCourse(courseId) {
      if (confirm('¿Estás seguro de eliminar este curso?')) {
        try {
          const token = localStorage.getItem('token'); // Obtener el token del localStorage
          const headers = {
            Authorization: `Bearer ${token}`, // Incluir el token en los encabezados
          };

          await axios.delete(`http://localhost:8000/api/coursess/${courseId}`, { headers });
          alert('Curso eliminado con éxito');
          this.fetchCourses(); // Recargar la lista de cursos
        } catch (error) {
          console.error('Error al eliminar el curso:', error);
        }
      }
    },

    // Reiniciar el formulario
    resetForm() {
      this.form = {
        title: '',
        subtitle: '',
        description: '',
        slug: '',
        user_id: '',
        level_id: '',
        category_id: '',
        price_id: '',
        status: 1
      };
      this.editing = false;
      this.currentCourseId = null;
    },
  },
  mounted() {
    this.fetchCourses(); // Cargar los cursos al montar la vista
  },
};
</script>

<style scoped>
.course-management {
  max-width: 1000px; /* Aumenté el ancho del panel */
  margin: 0 auto;
  padding: 20px;
}

h1, h2 {
  color: #333;
}

form {
  margin-bottom: 20px;
}

ul {
  list-style: none;
  padding: 0;
}

li {
  margin-bottom: 10px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

button {
  transition: all 0.3s ease;
}

button:hover {
  opacity: 0.8;
}
</style>
