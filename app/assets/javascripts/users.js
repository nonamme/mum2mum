let email_input = document.querySelector("#login-form #sessions_email");
let password_input = document.querySelector("#login-form #sessions_password");

let inputs = [email_input, password_input];

let mobile = document.querySelector(".mobile-btn");

mobile.addEventListener('click', (e) => {
  e.preventDefault();
  let side = document.querySelector('aside');

  side.classList.toggle('menu-in');
  console.log(side.classList);
});

(function(fields){
  fields.forEach((field) => {
    if(!field) return;

    field.addEventListener('click', (e) => {
      e.target.value = "";
    });

    field.addEventListener('blur', (e) => {
      if (e.target.value == '')
        e.target.value = 'Email';
    });
  });
})(inputs);
