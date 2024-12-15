<template>
  <div>
    <h1>Gestión de Usuarios</h1>

    <!-- Tabla de usuarios -->
    <table class="table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Nombre</th>
          <th>Email</th>
          <th>Roles</th>
          <th>Acciones</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="user in users" :key="user.id">
          <td>{{ user.id }}</td>
          <td>{{ user.name }}</td>
          <td>{{ user.email }}</td>
          <td>
            <!-- Mostrar roles actuales del usuario -->
            <ul>
              <li v-for="role in user.roles" :key="role.id">{{ role.name }}</li>
            </ul>
          </td>
          <td>
            <!-- Botón para editar roles -->
            <button @click="editUserRoles(user)">Editar Roles</button>
          </td>
        </tr>
      </tbody>
    </table>

    <!-- Modal para editar roles -->
    <div v-if="showEditModal" class="modal">
      <div class="modal-content">
        <h2>Editar Roles</h2>
        <label for="roles">Selecciona Roles</label>
        <select v-model="selectedRoles" multiple>
          <option v-for="role in roles" :key="role.id" :value="role.id">
            {{ role.name }}
          </option>
        </select>
        <button @click="updateRoles">Actualizar Roles</button>
        <button @click="closeModal">Cancelar</button>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      users: [], // Lista de usuarios
      roles: [], // Lista de roles
      selectedRoles: [], // Roles seleccionados para editar
      showEditModal: false, // Controlar la visibilidad del modal
      currentUser: null, // Usuario que está siendo editado
    };
  },
  mounted() {
    this.fetchUsers(); // Obtener la lista de usuarios
    this.fetchRoles(); // Obtener la lista de roles
  },
  methods: {
    // Obtener el token de autenticación desde el almacenamiento local
    getAuthToken() {
      return localStorage.getItem('auth_token'); // Asegúrate de que el token se haya guardado previamente en el localStorage
    },

    // Configurar axios para incluir el token de autenticación
    setAuthHeader() {
      const token = localStorage.getItem('auth_token'); // Obtén el token del localStorage
  if (token) {
    axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
  } else {
    console.error('Token no encontrado');
  }
    },

    // Obtener la lista de usuarios
    async fetchUsers() {
      this.setAuthHeader(); // Asegúrate de que el token se establezca
  try {
    const response = await axios.get('http://localhost:8000/api/users');
    console.log('Usuarios:', response.data);
    this.users = response.data;
  } catch (error) {
    console.error('Error al obtener usuarios:', error);
  }
    },

    // Obtener la lista de roles
    async fetchRoles() {
      try {
        this.setAuthHeader(); // Configurar el token en la cabecera
        const response = await axios.get('http://localhost:8000/api/roles');
        this.roles = response.data;
      } catch (error) {
        console.error('Error al obtener roles:', error);
      }
    },

    // Mostrar el modal de edición de roles
    editUserRoles(user) {
      this.currentUser = user;
      this.selectedRoles = user.roles.map(role => role.id); // Asignar roles actuales del usuario
      this.showEditModal = true;
    },

    // Actualizar los roles del usuario
    async updateRoles() {
      try {
        this.setAuthHeader(); // Configurar el token en la cabecera
        await axios.put(`http://localhost:8000/api/users/${this.currentUser.id}`, {
          roles: this.selectedRoles,
        });
        this.fetchUsers(); // Recargar la lista de usuarios después de actualizar
        this.closeModal(); // Cerrar el modal
      } catch (error) {
        console.error('Error al actualizar roles:', error);
      }
    },

    // Cerrar el modal
    closeModal() {
      this.showEditModal = false;
      this.selectedRoles = [];
      this.currentUser = null;
    }
  }
};
</script>

<style scoped>
/* Estilos básicos para la tabla y el modal */
.table {
  width: 100%;
  border-collapse: collapse;
}

.table th,
.table td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}

.modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
}

.modal-content {
  background: white;
  padding: 20px;
  border-radius: 5px;
  width: 300px;
}

select {
  width: 100%;
  height: 150px;
}
</style>
