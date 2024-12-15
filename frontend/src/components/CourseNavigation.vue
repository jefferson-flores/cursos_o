<template>
  <div>
    <!-- Título del Curso -->
    <h1 class="text-2xl text-center text-gray-700 hover:text-yellow-600 leading-8 mb-4">{{ course.title }}</h1>

    <!-- Perfil del Instructor -->
    <div class="flex items-center">
      <img :src="course.instructor.profile_photo_url" class="w-12 h-12 object-cover rounded-full mr-2" alt="Instructor">
      <div>
        <p>{{ course.instructor.name }}</p>
        <a :href="'/instructor/' + course.instructor.username" class="text-blue-400 text-sm">{{ '@' + course.instructor.username }}</a>
      </div>
    </div>

    <!-- Progreso del Curso -->
    <p class="text-gray-600 text-sm mt-2">{{ advance }} completo</p>
    <div class="relative pt-1">
      <div class="overflow-hidden h-2 mb-4 text-xs flex rounded bg-blue-200">
        <div :style="{ width: advance }" class="shadow-none flex flex-col text-center whitespace-nowrap text-white justify-center bg-blue-500 transition-all duration-500"></div>
      </div>
    </div>

    <!-- Lista de Secciones y Lecciones -->
    <ul>
      <li v-for="section in course.sections" :key="section.id" class="text-gray-600 mb-4">
        <p class="font-bold text-base inline-block mb-2 hover:text-blue-700">{{ section.name }}</p>
        <ul>
          <li v-for="lesson in section.lessons" :key="lesson.id" class="flex items-center">
            <span :class="lesson.completed ? 'bg-yellow-400' : 'bg-slate-500'" class="inline-block w-4 h-4 rounded-full mr-2 mt-1"></span>
            <a @click="changeLesson(lesson)" class="cursor-pointer hover:text-blue-600">{{ lesson.name }}</a>
          </li>
        </ul>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  props: ['course', 'advance'],
  methods: {
    changeLesson(lesson) {
      this.$emit('change-lesson', lesson);
    }
  }
};
</script>

<style scoped>
/* Estilos específicos para la navegación del curso */
</style>
