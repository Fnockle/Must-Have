/* Compteur de visite. Utilise localStorage*/
if(typeof localStorage!='undefined') {
  var visitNb = localStorage.getItem('visit');
  if(visitNb!=null) {
    visitNb = parseInt(visitNb);
  } else {
    visitNb = 1;
  }

  visitNb++;
  localStorage.setItem('visit',visitNb);
  document.getElementById('visit').innerHTML = visitNb;

} else {
  alert("localStorage n'est pas supporté");
}
