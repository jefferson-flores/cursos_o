INSTALACION DEL BACKEND
-Instalar las Dependencias de PHP: 
composer install 
-Configurar Variables de Entorno: Copia o rempllaza el archivo .env.example a .env y 
ajusta los parámetros de configuración según tu entorno local (base de datos, 
claves, etc.). 
cp .env.example .env 
aquí puedes configurar la base de datos según tus datos 
DB_CONNECTION=pgsql 
DB_HOST=tu-puerto-del-host 
DB_PORT=5432 
DB_DATABASE=nombre-de-tu-base-de-datos 
DB_USERNAME=tu-usuario 
DB_PASSWORD=tu-contraseña 
-Generar la Clave de la Aplicación:
php artisan key:generate 
-Migraciones de Base de Datos: Ejecuta las migraciones para crear las tablas en 
la base de datos. 
php artisan migrate
-Instalar Dependencias de Frontend: 
npm install 
compilar el proyecto
php artisan serve


INSTALACION DEL FRONTEND
-Instalar las Dependencias de Node.js: 
npm install
-Configurar las Rutas API: En el archivo src/api.js o donde esté configurada 
la comunicación con el backend, asegúrate de que las URLs estén configuradas 
correctamente según el entorno. 
-Compilar el Proyecto: 
npm run dev 