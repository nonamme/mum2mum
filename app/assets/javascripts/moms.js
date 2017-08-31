var search = document.querySelector("find-mum-search") || document.createElement('p');
var select = document.querySelector("select#status") || document.createElement('p');

search.addEventListener('keyup', (e) => {

  var list = document.querySelector("#mums-list") || document.querySelector("#places-list")

  if(e.keyCode >= 65 && e.keyCode <= 90 || e.keyCode == 8){
    for(var i = 0; i < list.children.length; i++){
      if( !list.children[i].querySelector('h3').textContent.match(new RegExp(e.target.value, "gi"))) {
        list.children[i].style.display = "none";
      } else if( list.children[i].querySelector('h3').textContent.match(new RegExp(e.target.value, "gi"))) {
        list.children[i].style.display = "list-item";
      }
    }
  } 
}, false);

select.addEventListener('change', (e) => {
  var mum_status = document.querySelectorAll("#mums-list li");

  mum_status.forEach((element) => {
    element.style.display = 'list-item';
   if(element.querySelector('p').textContent.toLowerCase() != e.target.value.toLowerCase()){
    element.style.display = 'none';
   }
  })
}, false);
