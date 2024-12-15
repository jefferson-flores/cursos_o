<template>
  <div>
    <h1 class="text-4xl font-bold text-center my-4">Bienvenido a MetaCursos</h1>
    <CourseList /> <!-- Aquí usas el componente CourseList -->
  </div>
</template>

<script>
import CourseList from '@/components/CourseList.vue'; // Importa CourseList

export default {
  components: {
    CourseList // Registra CourseList para su uso en la vista
  }
};
</script>

<style scoped>
/* Estilos específicos para la vista principal */
</style>
