<template>
  <div id="app" class="d-flex flex-column min-vh-100">
    <!-- Barra de navegación -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
      <div class="container">
        <a class="navbar-brand" href="#">MetaCursos</a>
        <button 
          class="navbar-toggler" 
          type="button" 
          data-bs-toggle="collapse" 
          data-bs-target="#navbarNav" 
          aria-controls="navbarNav" 
          aria-expanded="false" 
          aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav me-auto">
            <li class="nav-item">
              <router-link to="/" class="nav-link">Inicio</router-link>
            </li>
            <li class="nav-item" v-if="isLoggedIn">
              <router-link to="/all-courses" class="nav-link">Cursos</router-link>
            </li>
            <li class="nav-item" v-if="isLoggedIn">
              <router-link to="/course-miscursos" class="nav-link">Mis Cursos</router-link>
            </li>
            <li v-if="canAccessCourseManagement" class="nav-item">
              <router-link to="/courses-management" class="nav-link">Gestionar Cursos</router-link>
            </li>
          </ul>
          <ul class="navbar-nav">
            <li class="nav-item" v-if="!isLoggedIn">
              <router-link to="/login" class="nav-link">Iniciar Sesión</router-link>
            </li>
            <li class="nav-item" v-if="!isLoggedIn">
              <router-link to="/signup" class="nav-link">Registrarse</router-link>
            </li>
            <li class="nav-item" v-if="isLoggedIn">
              <span class="nav-link">Bienvenido, {{ username }}</span>
            </li>
            <li class="nav-item" v-if="isLoggedIn">
              <a class="nav-link" @click="logout">Cerrar Sesión</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Renderizado de las vistas según la ruta -->
    <router-view />
  </div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      isLoggedIn: !!localStorage.getItem('token'), // Verifica si hay un token
      canAccessCourseManagement: false, // Estado para el rol
    };
  },
  computed: {
    username() {
      return localStorage.getItem('username') || 'Usuario'; // Devuelve 'Usuario' si no hay nombre
    },
  },
  methods: {
    logout() {
      localStorage.removeItem('token');
      localStorage.removeItem('username');
      this.isLoggedIn = false;
      this.$router.push('/login');
    },
    async checkUserRole() {
      try {
        const token = localStorage.getItem('token');
        if (!token) return;

        const response = await fetch('http://localhost:8000/api/check-role', {
          method: 'GET',
          headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
          },
        });

        if (response.ok) {
          const data = await response.json();
          this.canAccessCourseManagement = data.success; // Si el usuario tiene rol adecuado
        } else {
          this.canAccessCourseManagement = false; // Si no tiene permisos
        }
      } catch (error) {
        console.error('Error al verificar rol del usuario:', error);
        this.canAccessCourseManagement = false; // En caso de error, negamos el acceso
      }
    },
  },
  mounted() {
    if (this.isLoggedIn) {
      this.checkUserRole(); // Verificar el rol cuando el componente se monta
    }
  },
  watch: {
    '$route'() {
      this.isLoggedIn = !!localStorage.getItem('token'); // Actualiza si hay token al cambiar la ruta
      if (this.isLoggedIn) {
        this.checkUserRole(); // Verificar el rol al cambiar de ruta
      }
    },
  },
};
</script>

<style>
/* Estilos globales */
body {
  background-color: #f8f9fa;
}

#app {
  padding: 20px;
}
</style>
