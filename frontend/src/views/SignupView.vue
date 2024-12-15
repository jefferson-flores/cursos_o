<template>
  <div class="min-vh-100 d-flex align-items-center justify-content-center bg-light">
    <div class="bg-white p-5 rounded shadow-sm w-100" style="max-width: 400px;">
      <h2 class="text-center text-dark mb-4">Registrarse</h2>
      <form @submit.prevent="register">
        <div class="mb-3">
          <label class="form-label text-secondary" for="name">Nombre</label>
          <input 
            v-model="name" 
            type="text" 
            id="name" 
            class="form-control" 
            required 
          />
        </div>
        <div class="mb-3">
          <label class="form-label text-secondary" for="email">Correo Electrónico</label>
          <input 
            v-model="email" 
            type="email" 
            id="email" 
            class="form-control" 
            required 
          />
        </div>
        <div class="mb-4">
          <label class="form-label text-secondary" for="password">Contraseña</label>
          <input 
            v-model="password" 
            type="password" 
            id="password" 
            class="form-control" 
            required 
          />
        </div>
        <button class="btn btn-success w-100">Registrarse</button>
        <p class="text-secondary text-center mt-3">
          ¿Ya tienes una cuenta? <router-link to="/login" class="text-primary">Iniciar sesión</router-link>
        </p>
      </form>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      name: '',
      email: '',
      password: ''
    };
  },
  methods: {
    async register() {
      try {
        const response = await axios.post('http://localhost:8000/api/register', {
          name: this.name,
          email: this.email,
          password: this.password
        });
        // Guardar token en localStorage
        localStorage.setItem('token', response.data.token);
        // Redirigir a la página de cursos
        this.$router.push('/courses');
      } catch (error) {
        console.error('Error al registrarse:', error.response ? error.response.data : error);
      }
    }
  }
};
</script>

<style scoped>
/* Agrega estilos adicionales si es necesario */
</style>
