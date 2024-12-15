<template>
  <div class="mb-6">
    <input
      type="text"
      v-model="searchQuery"
      placeholder="Buscar cursos..."
      class="border border-gray-300 rounded-lg py-2 px-4 w-full"
    />
    <button
      @click="searchCourses"
      class="mt-2 py-2 px-4 bg-blue-500 text-white rounded-lg hover:bg-blue-600"
    >
      Buscar
    </button>
  </div>
</template>

<script>
export default {
  name: 'SearchComponent',
  data() {
    return {
      searchQuery: '',
    };
  },
  methods: {
    searchCourses() {
      // Emitir el evento con la búsqueda
      this.$emit('search', this.searchQuery);
    },
  },
};
</script>

<style scoped>
/* Estilos específicos para el componente */
</style>
