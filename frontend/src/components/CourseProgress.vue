<template>
  <div>
    <h1>{{ course.title }}</h1>
    <p>Progreso: {{ progress }}</p>

    <div v-if="currentLesson">
      <h2>Lección Actual: {{ currentLesson.title }}</h2>
      <button @click="toggleCompletion">Marcar como {{ currentLesson.completed ? 'Incompleta' : 'Completa' }}</button>
    </div>

    <div v-if="previousLesson">
      <button @click="navigateLesson(previousLesson.id)">Lección Anterior</button>
    </div>
    <div v-if="nextLesson">
      <button @click="navigateLesson(nextLesson.id)">Próxima Lección</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  props: {
    id: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      course: {},
      currentLesson: {},
      progress: '',
      previousLesson: null,
      nextLesson: null
    };
  },
  async created() {
    await this.fetchCourseProgress();
  },
  methods: {

      getPreviousLesson(currentLessonId) {
    const index = this.course.lessons.findIndex(lesson => lesson.id === currentLessonId);
    return index > 0 ? this.course.lessons[index - 1] : null; // Devuelve la lección anterior o null si no hay
  },

  getNextLesson(currentLessonId) {
    const index = this.course.lessons.findIndex(lesson => lesson.id === currentLessonId);
    return index < this.course.lessons.length - 1 ? this.course.lessons[index + 1] : null; // Devuelve la siguiente lección o null si no hay
  },

     async calculateProgress() {
    // Suponiendo que cada lección completada cuenta como un 100% de progreso
    const totalLessons = this.course.lessons.length;
    const completedLessons = this.course.lessons.filter(lesson => lesson.completed).length;

    // Calcular el porcentaje de progreso
    return totalLessons > 0 ? (completedLessons / totalLessons * 100).toFixed(2) : 0;
  },

 async fetchCourseProgress() {
  const token = localStorage.getItem('token');
  if (!token) {
    this.$router.push('/login'); // Redirige a login si no hay token
    return;
  }
  

  try {
    const response = await axios.get(`http://localhost:8000/api/progress/${this.id}`, {
      headers: {
        Authorization: `Bearer ${token}`
      }
    });
    const data = response.data;

    this.course = data.course;
    this.currentLesson = data.currentLesson;
    this.progress = data.progress;
    this.previousLesson = data.previousLesson;
    this.nextLesson = data.nextLesson;

    // Almacena las lecciones en el curso
    this.course.lessons = data.course.lessons;
  } catch (error) {
    console.error('Error al obtener el progreso del curso:', error);
    if (error.response) {
      alert('Error: ' + (error.response.data.message || 'Error desconocido'));
    }
  }
},

async toggleCompletion() {
  const token = localStorage.getItem('token');
  if (!token) {
    this.$router.push('/login');
    return;
  }

  // Imprimir el ID de la lección actual para verificarlo
  console.log("ID de la lección actual:", this.currentLesson.id);

  try {
    const response = await axios.post(`http://localhost:8081/api/lessons/${this.currentLesson.id}/toggle-completion`, {}, {
      headers: {
        Authorization: `Bearer ${token}`
      }
    });

    const data = response.data;

    // Actualizar el estado directamente
    this.currentLesson.completed = !this.currentLesson.completed;
    this.progress = data.progress; // Actualizar el progreso

  } catch (error) {
    console.error('Error al cambiar el estado de la lección:', error);
    if (error.response) {
      alert('Error: ' + (error.response.data.message || 'Error desconocido'));
    } else {
      alert('Error de red: ' + error.message);
    }
  }
},



async navigateLesson(lessonId) {
    const token = localStorage.getItem('token');
    if (!token) {
      this.$router.push('/login'); // Redirige a login si no hay token
      return;
    }

    try {
      const lesson = this.course.lessons.find(lesson => lesson.id === lessonId);
      if (lesson) {
        this.currentLesson = lesson;
        // Actualiza las lecciones anterior y siguiente
        this.previousLesson = this.getPreviousLesson(lesson.id);
        this.nextLesson = this.getNextLesson(lesson.id);
        this.progress = await this.calculateProgress(); // Asegúrate de que esto esté disponible
      } else {
        console.error('Lección no encontrada');
      }
    } catch (error) {
      console.error('Error al navegar a la lección:', error);
    }
  }



  }
};
</script>

<style scoped>
/* Estilos específicos para el progreso del curso */
</style>
