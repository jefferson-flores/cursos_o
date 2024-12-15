<template>
  <div class="min-vh-100 d-flex align-items-center justify-content-center bg-light">
    <div class="bg-white p-5 rounded shadow-sm w-100" style="max-width: 400px;">
      <h2 class="text-center text-dark mb-4">Iniciar Sesión</h2>
      <form @submit.prevent="login">
        <div class="mb-3">
          <label for="email" class="form-label text-secondary">Correo Electrónico</label>
          <input 
            v-model="email" 
            type="email" 
            id="email" 
            class="form-control" 
            required 
          />
        </div>
        <div class="mb-3">
          <label for="password" class="form-label text-secondary">Contraseña</label>
          <input 
            v-model="password" 
            type="password" 
            id="password" 
            class="form-control" 
            required 
          />
        </div>
        <div class="d-flex justify-content-between mb-3">
          <div class="form-check">
            <input 
              type="checkbox" 
              v-model="rememberMe" 
              class="form-check-input" 
              id="remember" 
            />
            <label class="form-check-label text-secondary" for="remember">Recordar</label>
          </div>
          <router-link to="/forgot-password" class="text-primary"></router-link>
        </div>
        <button class="btn btn-primary w-100">Iniciar Sesión</button>
        <p class="text-secondary text-center mt-3">
          ¿No tienes una cuenta? <router-link to="/signup" class="text-primary">Regístrate</router-link>
        </p>
        <p v-if="errorMessage" class="text-danger text-center">{{ errorMessage }}</p> <!-- Mensaje de error -->
      </form>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      email: '',
      password: '',
      rememberMe: false,
      errorMessage: '' // Añadir un mensaje de error
    };
  },
  methods: {
    async login() {
      this.errorMessage = ''; // Reiniciar el mensaje de error antes de la solicitud
      try {
        const response = await axios.post('http://localhost:8000/api/login', {
          email: this.email,
          password: this.password,
          remember_me: this.rememberMe
        });
        // Guardar token en localStorage
        localStorage.setItem('token', response.data.token);
         localStorage.setItem('username', response.data.user.name); // Suponiendo que el nombre está en response.data.user.name
         
        // Redirigir a la página de cursos
        this.$router.push('/courses');
      } catch (error) {
        // Mostrar mensaje de error si hay un fallo en la solicitud
        this.errorMessage = error.response && error.response.data.message 
                           ? error.response.data.message 
                           : 'Error al iniciar sesión, por favor verifica tus credenciales.';
        console.error('Error al iniciar sesión:', error.response ? error.response.data : error);
      }
    }
  }
};
</script>

<style scoped>
/* Agrega estilos adicionales si es necesario */
</style>
