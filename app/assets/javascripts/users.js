var email_input = document.querySelector("#login-form #sessions_email");
var password_input = document.querySelector("#login-form #sessions_password");

var inputs = [email_input, password_input];

var mobile = document.querySelector(".mobile-btn");

mobile.addEventListener('click', function(e){
  e.preventDefault();
  var side = document.querySelector('aside');

  side.classList.toggle('menu-in');
});

(function(fields){
  fields.forEach(function(field){
    if(!field) return;

    field.addEventListener('click', function(e){
      e.target.value = "";
    });

    field.addEventListener('blur', function(e){
      if (e.target.value == '')
        e.target.value = 'Email';
    });
  });
})(inputs);
