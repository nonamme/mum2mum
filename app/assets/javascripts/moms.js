let search = document.querySelector("#find-mum-search");

search.addEventListener('keyup', (e) => {
  let mumsList = document.querySelector("#mums-list");

  if(e.keyCode >= 65 && e.keyCode <= 90 || e.keyCode == 8){
    for(var i = 0; i < mumsList.children.length; i++){
      if( !mumsList.children[i].querySelector('h3').textContent.match(new RegExp(e.target.value, "g"))) {
        mumsList.children[i].style.display = "none";
      } else if( mumsList.children[i].querySelector('h3').textContent.match(new RegExp(e.target.value, "g"))) {
        mumsList.children[i].style.display = "flex";
      }
    }
  } 
}, false);
