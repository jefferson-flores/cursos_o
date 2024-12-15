<template>
  <div class="bg-gray-100 min-h-screen p-4"> <!-- Fondo claro para toda la página -->
    <h1 class="text-center text-3xl font-bold mb-4">MetaCursos</h1>
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4"> <!-- Usando grid para organizar las tarjetas -->
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
import CourseCard from '@/components/CourseCard.vue'; // Importa el componente CourseCard

export default {
  components: {
    CourseCard, // Registra el componente
  },
  data() {
    return {
      courses: []
    };
  },
  mounted() {
    // Consumir la API de Laravel desde el backend
    axios.get('/courses')
      .then(response => {
        this.courses = response.data;
      })
      .catch(error => {
        console.error('Hubo un error:', error);
      });
  }
};
</script>

<style scoped>
/* Estilos específicos del componente */
</style>
