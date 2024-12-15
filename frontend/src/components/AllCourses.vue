<template>
  <div class="bg-gray-100 min-h-screen p-4">
    <h1 class="text-center text-3xl font-bold mb-4">Todos los Cursos</h1>

    <div class="mb-4">
      <h2 class="text-xl font-semibold">Cursos Destacados</h2>
      <div v-if="loading" class="text-center">Cargando cursos destacados...</div>
      <div v-else-if="featuredCourses.length === 0" class="text-center text-gray-500">
        No hay cursos destacados disponibles.
      </div>
      <div v-else class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 mb-6">
        <CourseCard
          v-for="course in featuredCourses"
          :key="course.id"
          :course="course"
        />
      </div>
    </div>

    <div>
      <h2 class="text-xl font-semibold">Otros Cursos</h2>
      <div v-if="loading" class="text-center">Cargando otros cursos...</div>
      <div v-else-if="otherCourses.length === 0" class="text-center text-gray-500">
        No hay otros cursos disponibles.
      </div>
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        <CourseCard
          v-for="course in otherCourses"
          :key="course.id"
          :course="course"
        />
      </div>
    </div>

    <div class="text-center mt-4">
      <ul class="pagination justify-content-center">
        <li class="page-item" :class="{ disabled: currentPage === 1 }">
          <button class="page-link" @click="previousPage">Anterior</button>
        </li>
        <li class="page-item" v-for="page in totalPages" :key="page" :class="{ active: page === currentPage }">
          <button class="page-link" @click="goToPage(page)">{{ page }}</button>
        </li>
        <li class="page-item" :class="{ disabled: currentPage === totalPages }">
          <button class="page-link" @click="nextPage">Siguiente</button>
        </li>
      </ul>
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
      featuredCourses: [], // Almacenará cursos destacados
      otherCourses: [], // Almacenará otros cursos
      loading: true, // Estado de carga
      limit: 10, // Limite para mostrar cursos
      currentPage: 1, // Página actual
      totalCourses: 0, // Total de cursos
      totalPages: 0 // Total de páginas
    };
  },
  mounted() {
    this.fetchAllCourses();
  },
  methods: {
    async fetchAllCourses(page = 1) {
      const token = localStorage.getItem('token');
      if (!token) {
        this.$router.push('/login');
        return;
      }

      try {
        const response = await axios.get(`http://localhost:8000/api/cursos?page=${page}&limit=${this.limit}`, {
          headers: {
            Authorization: `Bearer ${token}`
          }
        });

        this.featuredCourses = response.data.featuredCourses; // Cursos destacados
        this.otherCourses = response.data.otherCourses; // Otros cursos
        this.totalCourses = response.data.total; // Total de cursos
        this.totalPages = Math.ceil(this.totalCourses / this.limit); // Calcula el total de páginas
      } catch (error) {
        console.error('Error al obtener los cursos:', error);
        alert('Hubo un problema al cargar los cursos.');
      } finally {
        this.loading = false; // Finaliza el estado de carga
      }
    },
    goToPage(page) {
      this.currentPage = page;
      this.fetchAllCourses(page);
    },
    nextPage() {
      if (this.currentPage < this.totalPages) {
        this.goToPage(this.currentPage + 1);
      }
    },
    previousPage() {
      if (this.currentPage > 1) {
        this.goToPage(this.currentPage - 1);
      }
    }
  }
};
</script>

<style scoped>
/* Estilos específicos para la vista de todos los cursos */
</style>
