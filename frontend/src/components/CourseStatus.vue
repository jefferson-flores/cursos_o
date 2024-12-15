<template>
  <div class="container mx-auto p-4" v-if="course && course.category && course.level && course.price">
    <h1 class="text-3xl font-bold mb-4">{{ course.title }}</h1>
    <p class="text-gray-700 mb-2">{{ course.description }}</p>
    <p class="text-sm text-gray-500">Categoría: {{ course.category.name }}</p>
    <p class="text-sm text-gray-500">Nivel: {{ course.level.name }}</p>
    <p class="text-sm text-gray-500">Precio: {{ course.price.value }} {{ course.price.currency }}</p>

    <div v-if="isEnrolled" class="mt-4">
      <h2 class="text-2xl font-bold">Progreso del Curso</h2>
      <div v-for="section in course.sections" :key="section.id" class="mb-4">
        <h3 class="font-bold">{{ section.title }}</h3>
        <ul>
          <li v-for="lesson in section.lessons" :key="lesson.id">
            <span :class="{ 'text-green-500': lesson.completed, 'text-red-500': !lesson.completed }">
              {{ lesson.title }}
            </span>
          </li>
        </ul>
      </div>
    </div>

    <div class="mt-4">
      <h2 class="text-2xl font-bold">Objetivos</h2>
      <ul>
        <li v-for="goal in course.goals" :key="goal.id">
          {{ goal.name }}
        </li>
      </ul>
    </div>

    <div class="mt-4">
      <h2 class="text-2xl font-bold">Requisitos</h2>
      <ul>
        <li v-for="requirement in course.requirements" :key="requirement.id">
          {{ requirement.name }}
        </li>
      </ul>
    </div>

    <!-- Botón para ir al progreso del curso -->
    <div class="mt-4">
      <button @click="goToCourseProgress" class="btn btn-primary">
        Ir al curso
      </button>
    </div>
  </div>
  <div v-else class="text-center text-gray-500">Cargando detalles del curso...</div>
</template>

<script>
import axios from 'axios';

export default {
  props: {
    courseId: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      course: null, // Inicialmente null para controlar el renderizado condicional
      isEnrolled: false
    };
  },
  mounted() {
    console.log('courseId:', this.courseId); // Verificar que courseId esté definido
    this.fetchCourseDetails();
  },
  methods: {
    async fetchCourseDetails() {
  const token = localStorage.getItem('token');

  try {
    console.log('Haciendo solicitud para el curso ID:', this.courseId); // Verificar el ID del curso
    const response = await axios.get(`http://localhost:8000/api/courses-status/${this.courseId}`, {
      headers: token ? { Authorization: `Bearer ${token}` } : {} // Solo añadir el token si existe
    });
    this.course = response.data.course;
    this.isEnrolled = response.data.isEnrolled; // Esta variable puede estar en respuesta incluso sin autenticación
  } catch (error) {
    console.error('Error al obtener los detalles del curso:', error);
    alert('Hubo un problema al cargar los detalles del curso.');
  }
},
    goToCourseProgress() {
      // Redirige a la vista de progreso del curso usando el id del curso actual
      this.$router.push({ name: 'CourseProgress', params: { id: this.course.id } });
    }
  }
};
</script>

<style scoped>
/* Estilos específicos para el detalle del curso */
.btn {
  padding: 10px 20px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>
