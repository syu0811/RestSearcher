window.search = function(){
  if(typeof lat == "undefined" || typeof lng == "undefined") {
    document.getElementById( 'result' ).innerHTML = '<br><p>現在地の位置情報を取得してください。</p>';
  } else {
    let url = new URL("http://localhost:3000/results");
    // let url = new URL("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=e8cc8848cc539438");
    range = document.getElementById("range").value;
    url.searchParams.set('range', range);
    url.searchParams.set('lat', lat);
    url.searchParams.set('lng', lng);
    location.href = url.toString();
    // alert(url.toString());
  }
};