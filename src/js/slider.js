/* ***** DONNEES ***** */
const state = {};
const slides = [
  {path:"img/slider/berserk.jpg"},
  {path:"img/slider/tintin.jpg"},
  {path:"img/slider/comics.jpg"}
];


/* ***** FONCTIONS ***** */
function displayImage() {
  document.querySelector("#slide").src = slides[state.indexImage].path;
}

function nextImage() {

  if (state.indexImage === slides.length-1) {

    state.indexImage = 0;

  } else {

    state.indexImage++;

  }
   displayImage();
}

function previousImage() {

  if (state.indexImage === 0) {

    state.indexImage = slides.length-1;

  } else {

    state.indexImage--;

  }
   displayImage();
}

function randomImage() {
  //Le double tilde est un raccourcie pour Math.floor()
  let random = ~~(Math.random()*slides.length);

  if (state.indexImage === random) {

    return randomImage();

  }
  state.indexImage = random;
  displayImage();
}

function playImage() {

  if (state.timer) {

    clearInterval(state.timer);
    state.timer=null;

  }
  else {

    state.timer = setInterval(() => randomImage(), 2000);

  }
  displayImage();
}


/* ***** CODE PRINCIPAL ***** */
document.addEventListener("DOMContentLoaded", ()=> {
//appel par defaut au chargement de la page
  state.indexImage=0;
  state.timer=null;

  document.querySelector("#slider-next").addEventListener("click",()=>
  nextImage());
  document.querySelector("#slider-previous").addEventListener("click",()=>
  previousImage());

  playImage();
});
