window.next = function(page){
  let url = new URL(location.href);
  // let url = new URL("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=e8cc8848cc539438");
  url.searchParams.set('page', page + 1);
  location.href = url.toString();
  // alert(url.toString());
};

window.prev = function(page){
  let url = new URL(location.href);
  // let url = new URL("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=e8cc8848cc539438");
  url.searchParams.set('page', page - 1);
  location.href = url.toString();
  // alert(url.toString());
};
