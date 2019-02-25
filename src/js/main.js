/* Fonctions pour récupérer les données des oeuvres selon leurs catégories et leurs types.
Fetch = alternative à AJAX*/
function fetchComics(idCat){
  fetch('fetchComics.php?idCat='+idCat).then(r=>r.json()).then(r=>{

    let html = "";

    r.forEach((v, k) => {

      html += `<div class="individualComics">
                <article>
                  <h3>${v.comics_name}</h3>
                  <img src="img/comics/${v.picture}" alt="${v.comics_name}" height="181" width="125">
                  <p>${v.categorie}</p>
                </article>
                <article class="hidden">
                  <h3>${v.author_name}</h3>
                  <p>${v.comics_description}</p>
                  <p>Vous pourriez aimer : ${v.comics_alternative}</p>
                </article>
              </div>`;

    });

    document.getElementById('comics__list').innerHTML = html;

  }).catch(e => console.warn(e)); //gestion de potentielles erreurs
}

function fetchMangas(idCat){
  fetch('fetchMangas.php?idCat='+idCat).then(r=>r.json()).then(r=>{

    let html = "";

    r.forEach((v, k) => {

      html += `<div class="individualManga">
                <article>
                  <h3>${v.comics_name}</h3>
                  <img src="img/comics/${v.picture}" alt="${v.comics_name}" height="181" width="125">
                  <p>${v.categorie}</p>
                </article>
                <article class="hidden">
                  <h3>${v.author_name}</h3>
                  <p>${v.comics_description}</p>
                  <p>Vous pourriez aimer : ${v.comics_alternative}</p>
                </article>
              </div>`;

    });

    document.getElementById('mangas__list').innerHTML = html;

  }).catch(e => console.warn(e));
}

function fetchBds(idCat){
  fetch('fetchBds.php?idCat='+idCat).then(r=>r.json()).then(r=>{

    let html = "";

    r.forEach((v, k) => {

      html += `<div class="individualBD">
                <article>
                  <h3>${v.comics_name}</h3>
                  <img src="img/comics/${v.picture}" alt="${v.comics_name}" height="181" width="125">
                  <p>${v.categorie}</p>
                </article>
                <article class="hidden">
                  <h3>${v.author_name}</h3>
                  <p>${v.comics_description}</p>
                  <p>Vous pourriez aimer : ${v.comics_alternative}</p>
                </article>
              </div>`;

    });

    document.getElementById('bds__list').innerHTML = html;

  }).catch(e => console.warn(e));
}
