let email_input = document.querySelector("#login-form #sessions_email");
let password_input = document.querySelector("#login-form #sessions_password");

let inputs = [email_input, password_input];

(function(fields){
  fields.forEach((field) => {
    field.addEventListener('click', (e) => {
      e.target.value = "";
    });

    field.addEventListener('blur', (e) => {
      if (e.target.value == '')
        e.target.value = 'Email';
    });
  });
})(inputs);
