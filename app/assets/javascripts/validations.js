let validTextarea= document.querySelector('textarea') || document.createElement('textarea');
let textInput = document.querySelectorAll("input[type='text']") || document.createElement('input');
let emailInputs = document.querySelectorAll("input[type='email']") || document.createElement('input');

let oldValue = "";

emailInputs.forEach(emailInput => {
  emailInput.addEventListener('blur', (e) =>{
    if (!isValidEmail(e.target.value)){
      alert("This is not an email!");
      e.target.value = oldValue;
    }
  });
});

validTextarea.addEventListener('blur', () =>  oldValue = '');
validTextarea.addEventListener('keyup', (e) => {

  if( /\'/.test(e.target.value)){
    alert("This character (') is not allowed, please use double quotes(\") insted.");
    e.target.value = oldValue;
  }
  oldValue = e.target.value;
});

textInput.forEach( input => {
  input.addEventListener('blur', () =>  oldValue = '');

  input.addEventListener('keyup', (e) => {
  if (isPostcodeField(e.target.id) ){
    if(!isValidPostcode(e.target.value)){
     alert("Is not valid character for POSTCODE!");
     e.target.value = oldValue;
    }
     oldValue = e.target.value;
  } else {
    if( !isOnlyLetters(e.target.value) ){
     alert("This character is not allowed, please use upper and downcase letters with space between words insted.");
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
  return /^[A-Za-z0-9]*$/.test(string);
}

function isPostcodeField(field){
  return /post(.){0,1}code/.test(field);
}

function isValidEmail(email){
  return /^(.+)@(.+)$/.test(email);
}

// Links Validation
// Date validation?
