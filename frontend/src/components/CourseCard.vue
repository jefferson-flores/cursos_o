<template>
  <div class="bg-white shadow-md rounded-lg overflow-hidden">
    <img
      class="w-full h-48 object-cover"
      :src="course.image"
      alt="Curso"
    />
    <div class="p-4">
      <div class="font-bold text-xl mb-2">{{ course.title }}</div>
      <p class="text-gray-700 text-base">{{ course.description }}</p>
    </div>
    <div class="px-4 pb-4">
      <button
        @click="enrollInCourse"
        style="background-color: transparent; border: 2px solid #007bff; color: #007bff;"
        class="px-4 py-2 rounded-md shadow transition-transform duration-300 ease-in-out transform hover:translate-y-1 hover:bg-blue-600 hover:text-white focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
      >
        Inscribirse en este curso
      </button>
      <button
        @click="goToCourseStatus"
        style="background-color: transparent; border: 2px solid #007bff; color: #007bff; margin-top: 10px;"
        class="px-4 py-2 rounded-md shadow transition-transform duration-300 ease-in-out transform hover:translate-y-1 hover:bg-blue-600 hover:text-white focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50"
      >
        Más información
      </button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  props: {
    course: {
      type: Object,
      required: true
    }
  },
  methods: {
    async enrollInCourse() {
      const token = localStorage.getItem('token');

      if (!token) {
        // Redirigir a la página de inicio de sesión si no hay token
        this.$router.push('/login');
        return;
      }

      try {
        await axios.post(`http://localhost:8000/api/courses/${this.course.slug}/enrolled`, {}, {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });
        alert('Te has inscrito en el curso con éxito');

        // Redirige a la vista de estado del curso después de inscribirse
        this.$router.push({ name: 'CourseStatus', params: { courseId: this.course.id } });
      } catch (error) {
        console.error('Error al inscribirse en el curso:', error.response ? error.response.data : error);
        alert('No se pudo inscribir en el curso. Intenta nuevamente.');
      }
    },
    goToCourseStatus() {
      // Redirige a la vista de CourseStatus sin necesidad de autenticación
      this.$router.push({ name: 'CourseStatus', params: { courseId: this.course.id } });
    }
  }
};
</script>

<style scoped>
/* Estilos específicos del componente CourseCard */
</style>
