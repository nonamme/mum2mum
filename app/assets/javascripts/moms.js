let search = document.querySelector("#find-mum-search");
let select = document.querySelector("select#status");

search.addEventListener('keyup', (e) => {
  let mumsList = document.querySelector("#mums-list");

  if(e.keyCode >= 65 && e.keyCode <= 90 || e.keyCode == 8){
    for(var i = 0; i < mumsList.children.length; i++){
      if( !mumsList.children[i].querySelector('h3').textContent.match(new RegExp(e.target.value, "gi"))) {
        mumsList.children[i].style.display = "none";
      } else if( mumsList.children[i].querySelector('h3').textContent.match(new RegExp(e.target.value, "gi"))) {
        mumsList.children[i].style.display = "list-item";
      }
    }
  } 
}, false);

select.addEventListener('change', (e) => {
  let mum_status = document.querySelectorAll("#mums-list li");

  mum_status.forEach((element) => {
    element.style.display = 'list-item';
   if(element.querySelector('p').textContent.toLowerCase() != e.target.value.toLowerCase()){
    element.style.display = 'none';
   }
  })
}, false);
