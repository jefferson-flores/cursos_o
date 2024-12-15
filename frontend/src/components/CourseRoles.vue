<template>
  <div class="container">
    <h1 class="title">Gestión de Roles</h1>

    <!-- Listado de Roles -->
    <div class="roles-list">
      <h2>Lista de Roles</h2>
      <div class="card" v-for="role in roles" :key="role.id">
        <div class="card-content">
          <h3>{{ role.name }}</h3>
          <div class="card-actions">
            <button class="btn btn-edit" @click="editRole(role)">Editar</button>
            <button class="btn btn-delete" @click="deleteRole(role.id)">Eliminar</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Formulario para Crear/Editar Roles -->
    <div class="form-container">
      <h2>{{ isEditing ? "Editar Rol" : "Crear Rol" }}</h2>
      <form @submit.prevent="submitForm" class="form">
        <div class="form-group">
          <label for="name">Nombre del Rol:</label>
          <input type="text" id="name" v-model="roleForm.name" placeholder="Nombre del Rol" required />
        </div>
        
        <div class="form-group">
          <label for="permissions">Permisos:</label>
          <select id="permissions" multiple v-model="roleForm.permissions">
            <option v-for="permission in permissions" :key="permission.id" :value="permission.id">
              {{ permission.name }}
            </option>
          </select>
        </div>

        <div class="form-actions">
          <button type="submit" class="btn btn-submit">{{ isEditing ? "Actualizar" : "Crear" }}</button>
          <button type="button" class="btn btn-cancel" @click="resetForm">Cancelar</button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      roles: [], // Lista de roles
      permissions: [], // Lista de permisos
      roleForm: {
        id: null, // ID del rol (solo para edición)
        name: "",
        permissions: [],
      },
      isEditing: false, // Indica si se está editando
    };
  },
  methods: {
    async fetchRoles() {
      try {
        const response = await axios.get("http://localhost:8000/api/roles", this.getAuthHeaders());
        this.roles = response.data;
      } catch (error) {
        this.handleError(error);
      }
    },
    async fetchPermissions() {
      try {
        const response = await axios.get("http://localhost:8000/api/roles/create", this.getAuthHeaders());
        this.permissions = response.data;
      } catch (error) {
        this.handleError(error);
      }
    },
    async submitForm() {
      try {
        if (this.isEditing) {
          await axios.put(`http://localhost:8000/api/roles/${this.roleForm.id}`, this.roleForm, this.getAuthHeaders());
          alert("Rol actualizado con éxito");
        } else {
          await axios.post("http://localhost:8000/api/roles", this.roleForm, this.getAuthHeaders());
          alert("Rol creado con éxito");
        }
        this.fetchRoles();
        this.resetForm();
      } catch (error) {
        this.handleError(error);
      }
    },
    async deleteRole(roleId) {
      if (confirm("¿Estás seguro de eliminar este rol?")) {
        try {
          await axios.delete(`/api/admin/roles/${roleId}`, this.getAuthHeaders());
          alert("Rol eliminado con éxito");
          this.fetchRoles();
        } catch (error) {
          this.handleError(error);
        }
      }
    },
    editRole(role) {
      this.isEditing = true;
      this.roleForm.id = role.id;
      this.roleForm.name = role.name;
      this.roleForm.permissions = role.permissions.map((perm) => perm.id);
    },
    resetForm() {
      this.isEditing = false;
      this.roleForm = { id: null, name: "", permissions: [] };
    },
    // Función para obtener los encabezados de autenticación
    getAuthHeaders() {
      const token = localStorage.getItem("auth_token"); // Cambiar según dónde guardes el token
      if (!token) {
        throw new Error("Token no disponible. Por favor, inicia sesión.");
      }
      return {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      };
    },
    // Manejo de errores
    handleError(error) {
      console.error("Error:", error.response || error.message);
      if (error.response?.status === 401) {
        alert("Sesión expirada. Por favor, inicia sesión nuevamente.");
        // Redirige al login o realiza una acción específica
        window.location.href = "/login";
      } else {
        alert("Ocurrió un error. Por favor, intenta nuevamente.");
      }
    },
  },
  created() {
    this.fetchRoles();
    this.fetchPermissions();
  },
};
</script>
<style scoped>
/* Contenedor principal */
.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  font-family: Arial, sans-serif;
  background: #f9f9f9;
  border-radius: 10px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

/* Títulos */
.title {
  text-align: center;
  color: #333;
  margin-bottom: 20px;
}

/* Estilo de tarjetas */
.roles-list {
  margin-bottom: 30px;
}
.card {
  background: #fff;
  border: 1px solid #ddd;
  border-radius: 8px;
  padding: 15px;
  margin-bottom: 15px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}
.card-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.card-actions button {
  margin-right: 10px;
}

/* Botones */
.btn {
  padding: 8px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  color: #fff;
  font-weight: bold;
  transition: background-color 0.3s, transform 0.2s;
}
.btn-edit {
  background-color: #2196f3;
}
.btn-edit:hover {
  background-color: #1976d2;
  transform: translateY(-2px);
}
.btn-delete {
  background-color: #f44336;
}
.btn-delete:hover {
  background-color: #d32f2f;
  transform: translateY(-2px);
}
.btn-submit {
  background-color: #4caf50;
}
.btn-submit:hover {
  background-color: #388e3c;
  transform: translateY(-2px);
}
.btn-cancel {
  background-color: #9e9e9e;
}
.btn-cancel:hover {
  background-color: #616161;
  transform: translateY(-2px);
}

/* Formulario */
.form-container {
  background: #fff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}
.form-group {
  margin-bottom: 15px;
}
label {
  display: block;
  margin-bottom: 5px;
  color: #333;
}
input, select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
}
.form-actions {
  text-align: right;
}
</style>