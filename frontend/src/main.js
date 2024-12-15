import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import vuetify from './plugins/vuetify';
import { loadFonts } from './plugins/webfontloader';
import axios from 'axios'; // Importar Axios
import 'bootstrap/dist/css/bootstrap.min.css';
import './assets/tailwind.css';


// Cargar las fuentes
loadFonts();

// Configurar la base URL de Axios
axios.defaults.baseURL = 'http://localhost:8000/api'; // URL del backend Laravel

// Crear la instancia de la aplicación Vue
createApp(App)
  .use(vuetify) // Usar Vuetify
  .use(router) // Usar el router
  .mount('#app'); // Montar la aplicación en el elemento con id 'app'
