var validTextarea= document.querySelector('textarea') || document.createElement('textarea');
var textInput = document.querySelectorAll("input[type='text']") || document.createElement('input');
var emailInputs = document.querySelectorAll("input[type='email']") || document.createElement('input');

var oldValue = "";

emailInputs.forEach(function(emailInput){
  emailInput.addEventListener('blur', function(e){
    oldValue = e.target.value;
    if ( e.target.value != "" && !isValidEmail(e.target.value)){
      alert("This is not an email!");
      e.target.value = oldValue;
    } else if(e.target.value == "") {
      return;
    }
  });
});

validTextarea.addEventListener('blur', function(){ 
  oldValue = '';
});

validTextarea.addEventListener('keyup', function(e){

  if( /\'/.test(e.target.value)){
    alert("This character (') is not allowed, please use double quotes(\") insted.");
    e.target.value = oldValue;
  }
  oldValue = e.target.value;
});

textInput.forEach( function(input){
  input.addEventListener('blur', function(){
    oldValue = '';
  });

  input.addEventListener('keyup', function(e){
  if ( /_link/.test(e.target.id)){
    return;
  }

  if (isPostcodeField(e.target.id) ){
    if(!isValidPostcode(e.target.value)){
     alert("Is not valid character for POSTCODE!");
     e.target.value = oldValue;
    }
     oldValue = e.target.value;
  } else {
    if( !isAlphanumeric(e.target.value) ){
      console.log(e);
     alert("This character is not allowed, please use upper and downcase characters with space between words instead.");
     e.target.value = oldValue;
    }
     oldValue = e.target.value;
    } 
  });
});

function isValidPostcode(postcode){
  return /^[A-Za-z0-9 \-\s]*$/g.test(postcode);
}

function isOnlyLetters(string){
  return /^[A-Za-z \.]*$/.test(string);
}

function isAlphanumeric(string){
  return /^[A-Za-z0-9 ]*$/.test(string);
}

function isPostcodeField(field){
  return /post(.){0,1}code/.test(field);
}

function isValidEmail(email){
  return /^(.+)@(.+)$/.test(email);
}
