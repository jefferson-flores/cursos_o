<template>
  <div>
    <div class="embed-responsive">
      <iframe :src="currentLesson.iframe" width="100%" height="400px"></iframe>
    </div>

    <h1 class="text-3xl text-gray-600 font-bold mt-4">{{ currentLesson.name }}</h1>
    <p v-if="currentLesson.description" class="text-gray-600">{{ currentLesson.description }}</p>

    <div class="flex justify-between mt-4">
      <!-- Finalizar unidad -->
      <div class="flex items-center cursor-pointer" @click="toggleCompleted">
        <i :class="currentLesson.completed ? 'fas fa-toggle-on text-2xl text-green-600' : 'fas fa-toggle-off text-2xl text-gray-600'"></i>
        <p class="text-sm ml-2">Finalizar la unidad</p>
      </div>

      <!-- Descargar recursos -->
      <div v-if="currentLesson.resource" class="flex items-center text-gray-600 cursor-pointer" @click="downloadResource">
        <i class="fas fa-download text-lg"></i>
        <p class="text-sm ml-2">Descargar recursos</p>
      </div>
    </div>

    <!-- Navegación -->
    <div class="card mt-2">
      <div class="card-body flex font-bold text-gray-600 shadow">
        <button v-if="previousLesson" @click="changeLesson(previousLesson)" class="cursor-pointer hover:text-blue-500">Unidad anterior</button>
        <button v-if="nextLesson" @click="changeLesson(nextLesson)" class="ml-auto cursor-pointer hover:text-blue-500">Siguiente unidad</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['currentLesson', 'previousLesson', 'nextLesson'],
  methods: {
    toggleCompleted() {
      // Cambiar el estado de completado
      this.$emit('toggle-completed');
    },
    changeLesson(lesson) {
      // Cambiar la lección actual
      this.$emit('change-lesson', lesson);
    },
    downloadResource() {
      // Lógica para descargar el recurso actual
      this.$emit('download-resource');
    }
  }
};
</script>

<style scoped>
/* Estilos específicos para la lección actual */
</style>
    