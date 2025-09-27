# 001 SGT - USO DEL PROYECTO Y SU ESTRUCTURA

## 1. Propósito
Este README explica cómo funciona la **Estructura del proyecto** y cómo **Usarlo de manera correcta**

---

## 2. Estructura del Proyecto

La estructura del proyecto está organizada para facilitar el desarrollo, mantenimiento y escalabilidad. Cada carpeta y archivo tiene un propósito específico.

sgt/
├─ assets/ → Recursos estáticos
│ ├─ css/ → Archivos de estilos (ej. index.css)
│ └─ js/ → Archivos de scripts (ej. index.js)
├─ includes/ → Archivos reutilizables
│ ├─ header.php → Encabezado común, carga librerías y CSS
│ ├─ footer.php → Pie de página común, carga scripts JS
│ └─ session.php → Control de sesión y seguridad de usuarios
├─ api/ → Endpoints para llamadas AJAX
├─ database/ → Respaldos de la base de datos
├─ index.php → Página principal del proyecto


### Cómo usar esta estructura

1. **header.php**  
   En este archivo van las librerías y links CSS. Se debe agregar con un include a cada página que quiera tener cargadas las librerías y estilos.

2. **footer.php**  
   En este archivo van los scripts y librerías del proyecto y, de la misma forma que el header, se debe llamar con un include.

Con esta estructura, cualquier desarrollador puede agregar nuevas páginas, módulos o scripts sin romper el flujo del proyecto.

---

# 002 SGT - Gestión de Sesiones y Usuarios

## 1. Propósito
Este README explica cómo funciona la **estructura de sesión de usuarios** y cómo **crear un usuario administrador** dentro del proyecto.

---

## 2. Estructura de Sesiones

### Archivo: `includes/session.php`

- **Función:** protege páginas privadas y mantiene los datos del usuario logueado.
- **Qué hace:**
  1. `session_start()` → inicia la sesión PHP.
  2. Verifica si existe `$_SESSION['user_id']`.  
     - Si no existe → redirige al `login.php`.
  3. Recupera variables importantes del usuario:
    ```php
    $user_id   = $_SESSION['user_id'];   // ID en la base de datos
    $username  = $_SESSION['username'];  // Nombre de usuario
    $user_role = $_SESSION['role'];      // Rol (admin, staff, member)
    ```
- **Extra de seguridad:**
  - Regenerar el ID de sesión (`session_regenerate_id(true)`) cada cierto tiempo.
  - Guardar IP y user-agent para prevenir secuestro de sesión:
    ```php
    $_SESSION['ip_address'] = $_SERVER['REMOTE_ADDR'];
    $_SESSION['user_agent'] = $_SERVER['HTTP_USER_AGENT'];
    ```

### Cómo usarlo

1. Incluir al inicio de cualquier página protegida:
    ```php
    <?php include 'includes/session.php'; ?>
    ```
2. Ahora `$user_id`, `$username` y `$user_role` estarán disponibles para usar.

3. Ejemplo de control de rol:
    ```php
    if ($user_role !== 'admin') {
        header("Location: no_autorizado.php");
        exit();
    }
    ```
    Esto indica que si algún usuario con un perfil diferente a admin intenta ingresar a la página, será redirigido a `no_autorizado.php`.

---

## 3. Login y Logout

### Login
- Formulario: `login.php`  
- Procesamiento: `login_process.php`  
  - Valida usuario y contraseña.  
  - Crea variables de sesión (`user_id`, `username`, `role`).  
  - Actualiza `last_login` en la base de datos (campo que registra la última sesión activa con fecha y hora).

### Logout
- Archivo: `logout.php`  
- Lo que hace:
  1. Limpia todas las variables de sesión.  
  2. Elimina la cookie de sesión.  
  3. Destruye la sesión en el servidor.  
  4. Redirige al login.

---

## 4. Crear un Usuario Administrador

### Archivo: `create_admin.php`
- **Función:** inserta un usuario administrador inicial en la base de datos.  
- **Qué hace:**
  1. Define datos básicos (`username`, `password`, `email`, `role`, etc.).  
  2. Encripta la contraseña con `password_hash()`.  
  3. Inserta el usuario en la tabla `users`.

- **Cómo usarlo:**
  1. Abrir en el navegador:
     ```
     http://localhost/sgt/create_admin.php
     ```
  2. Se mostrará un mensaje si se creó correctamente.

  NOTA: Evitar solicitar un nuevo usuario admin para evitar errores en la DB (en cualquier caso, cambiar los datos).

---

## 5. Flujo Básico

Login → `procesar_login.php` → sesión creada (`$_SESSION`) → páginas protegidas incluyen `session.php` → Logout → `logout.php`
