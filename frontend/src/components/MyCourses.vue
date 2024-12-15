<template>
  <div class="bg-gray-100 min-h-screen p-4">
    <h1 class="text-center text-3xl font-bold mb-4">Mis Cursos Inscritos</h1>
    <div v-if="courses.length === 0" class="text-center text-gray-500">
      No estás inscrito en ningún curso.
    </div>
    <div v-else class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
      <CourseCard
        v-for="course in courses"
        :key="course.id"
        :course="course"
      />
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import CourseCard from '@/components/CourseCard.vue';

export default {
  components: {
    CourseCard
  },
  data() {
    return {
      courses: [] // Almacenará los cursos inscritos
    };
  },
  mounted() {
    this.fetchEnrolledCourses();
  },
  methods: {
    async fetchEnrolledCourses() {
      const token = localStorage.getItem('token');
      if (!token) {
        this.$router.push('/login');
        return;
      }

      try {
        // Llamada al endpoint de cursos inscritos
        const response = await axios.get('http://localhost:8000/api/course-miscursos', {
          headers: {
            Authorization: `Bearer ${token}`
          }
        });
        
        // Asegúrate de que la respuesta tenga la estructura adecuada
        this.courses = response.data; // Asigna los cursos obtenidos
      } catch (error) {
        console.error('Error al obtener los cursos inscritos:', error);
        alert('Hubo un problema al cargar tus cursos.');
      }
    }
  }
};
</script>

<style scoped>
/* Estilos específicos para la vista de mis cursos */
</style>
