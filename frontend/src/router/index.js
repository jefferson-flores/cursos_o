import { createRouter, createWebHistory } from 'vue-router';
import HomeView from '../views/HomeView.vue'; // Asegúrate de que las rutas sean correctas
import LoginView from '../views/LoginView.vue';// ruta del inicio de sesion 
import SignupView from '../views/SignupView.vue';// ruta del registro se sesion
import CourseList from '../components/CourseList.vue'; // Ruta para la lista de cursos
import MyCourses from '../components/MyCourses.vue';// ruta para mostrar los cursos del usuario
import AllCourses from '../components/AllCourses.vue';// ruta para mostrar todos los cursos
import CourseStatus from '../components/CourseStatus.vue';//ruta para mostrar los detalles del curso
import CourseProgress from '../components/CourseProgress.vue';//ruta para mostrar el progreso del curso
import CourseManagement from '../components/CourseManagement.vue';//ruta para la gestion de cursos
import CourseRoles from '../components/CourseRoles.vue';//ruta para gestionar roles
import UserManagement from '../components/UserManagement.vue';//ruta para gestionar usuarios y asignarle roles
//import CourseStatus from '../components/CourseStatus.vue'; // Importa el componente CourseStatus

const routes = [
    {
        path: '/',
        name: 'HomeView',
        component: HomeView
    },
    {
        path: '/login',
        name: 'LoginView',
        component: LoginView
    },
    {
        path: '/signup',
        name: 'SignupView',
        component: SignupView
    },
    {
        path: '/courses',
        name: 'CourseList',
        component: CourseList
    },
    {
        path: '/course-miscursos',
        name: 'MyCourses',
        component: MyCourses,
        meta: { requiresAuth: true }, // Requiere autenticación
        beforeEnter: (to, from, next) => {
            // Verificar si el usuario está logueado
            if (!localStorage.getItem('token')) {
              // Si no está logueado, redirigir al login
              next('/login');
            } else {
              next(); // Si está logueado, continuar a la página de "Mis Cursos"
            }
          },
      },
      {
        path: '/all-courses',
        name: 'AllCourses',
        component: AllCourses,
        beforeEnter: (to, from, next) => {
            // Verificar si el usuario está logueado
            if (!localStorage.getItem('token')) {
              // Si no está logueado, redirigir al login
              next('/login');
            } else {
              next(); // Si está logueado, continuar a la página de "Mis Cursos"
            }
          },
      },
      {
        path: '/courses-status/:courseId',
        name: 'CourseStatus',
        component: CourseStatus,
        props: true,
        
      },

      {
        path: '/courses-progress/:id',
        name: 'CourseProgress',
        component: CourseProgress,
        props: true
      },

     {
        path: '/courses-management',
        name: 'CourseManagement',
        component: CourseManagement,
        meta: { requiresAuth: true },
        
      },
      {
        path:'/courses-roles',
        name: 'CoursesRoles',
        component: CourseRoles,
        props: true
      },
      {
        path:'/user-management',
        name: 'UserManagement',
        component: UserManagement,
        props: true

      }
];

const router = createRouter({
    history: createWebHistory(),
    routes
});

// Middleware para proteger rutas que necesitan autenticación
router.beforeEach((to, from, next) => {
    const isAuthenticated = localStorage.getItem('token'); // Supón que el token se guarda en localStorage
    if (to.meta.requiresAuth && !isAuthenticated) {
        next({ name: 'LoginView' }); // Redirigir al login si no está autenticado
    } else {
        next();
    }
});

export default router;
