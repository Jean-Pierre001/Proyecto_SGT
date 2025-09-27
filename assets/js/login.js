// ATENCION AQUI IRAN TODOS LOS SCRIPS JS DEL PROYECTO INTENTAR AGRUPARLOS POR ARCHIVOS SEGUN SU FUNCION

//LOGIN.PHP
// script para mostrar/ocultar contraseña 

 const togglePassword = document.querySelector('#togglePassword i');
 const password = document.querySelector('#password');

 togglePassword.parentElement.addEventListener('click', () => {
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);

    togglePassword.classList.toggle('fa-eye');
    togglePassword.classList.toggle('fa-eye-slash');
});
//LOGIN.PHP