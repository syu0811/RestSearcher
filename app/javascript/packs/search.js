window.addEventListener('DOMContentLoaded', ()=>{
  var button = document.getElementById("search");
  button.addEventListener("click", search);
  function search () {
    let url = new URL(location);
    radius = document.getElementById("radius").value;
    url.searchParams.set('radius', radius);
    url.searchParams.append('lat', lat);
    url.searchParams.append('lng', lng);
    location.href = url.toString();
    alert(url.toString());
  }
});