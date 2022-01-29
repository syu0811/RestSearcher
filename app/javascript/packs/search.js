window.addEventListener('DOMContentLoaded', ()=>{
  var button = document.getElementById("search");
  button.addEventListener("click", search);
  function search () {
    let url = new URL(location);
    radius = document.getElementById("radius").value;
    url.searchParams.set('radius', radius);
    location.href = url.toString();
    alert(url.toString());
  }
});