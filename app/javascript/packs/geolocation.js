window.checkGeolocatioon = function(){
  // Geolocation APIに対応している
  if( navigator.geolocation )
  {
    // 現在位置を取得できる場合の処理
    alert( "あなたの端末では、現在位置を取得することができます。" ) ;

    // 現在位置を取得する
    navigator.geolocation.getCurrentPosition( successFunc , errorFunc , optionObj );
  }
  // Geolocation APIに対応していない
  else
  {
    // 現在位置を取得できない場合の処理
    alert( "あなたの端末では、現在位置を取得できません。" ) ;
  }
}

// 成功した時の関数
function successFunc( position )
{
	// 取得したデータの整理
  var data = position.coords ;

  // データの整理
  var lat = data.latitude ;
  var lng = data.longitude ;
  var alt = data.altitude ;
  var accLatlng = data.accuracy ;
  var accAlt = data.altitudeAccuracy ;
  var heading = data.heading ;			//0=北,90=東,180=南,270=西
  var speed = data.speed ;

  // アラート表示
	alert( "あなたの現在位置は、\n[" + lat + "," + lng + "]\nです。" ) ;

  // HTMLへの書き出し
  document.getElementById( 'result' ).innerHTML = '<dl><dt>緯度</dt><dd>' + lat + '</dd><dt>経度</dt><dd>' + lng + '</dd><dt>高度</dt><dd>' + alt + '</dd><dt>緯度、経度の精度</dt><dd>' + accLatlng + '</dd><dt>高度の精度</dt><dd>' + accAlt + '</dd><dt>方角</dt><dd>' + heading + '</dd><dt>速度</dt><dd>' + speed + '</dd></dl>' ;
  //document.getElementById( 'result' ).innerHTML = '<h1>aaa</h1>' ;

  // // 位置情報
  // var latlng = new google.maps.LatLng( lat , lng ) ;

  // // Google Mapsに書き出し
  // var map = new google.maps.Map( document.getElementById( 'map-canvas' ) , {
  //   zoom: 15 ,				// ズーム値
  //   center: latlng ,		// 中心座標 [latlng]
  // } ) ;

  // // マーカーの新規出力
  // new google.maps.Marker( {
  //   map: map ,
  //   position: latlng ,
  // } ) ;
}

// 失敗した時の関数
function errorFunc( error )
{
	// エラーコード(error.code)の番号
	// 0:UNKNOWN_ERROR				原因不明のエラー
	// 1:PERMISSION_DENIED			利用者が位置情報の取得を許可しなかった
	// 2:POSITION_UNAVAILABLE		電波状況などで位置情報が取得できなかった
	// 3:TIMEOUT					位置情報の取得に時間がかかり過ぎた…

	// エラー番号に対応したメッセージ
	var errorInfo = [
		"原因不明のエラーが発生しました。" ,
		"位置情報の取得が許可されませんでした。" ,
		"電波状況などで位置情報が取得できませんでした。" ,
		"位置情報の取得に時間がかかり過ぎてタイムアウトしました。"
	] ;

	// エラー番号
	var errorNo = error.code ;

	// エラーメッセージ
	var errorMessage = "[エラー番号: " + errorNo + "]\n" + errorInfo[ errorNo ] ;

	// アラート表示
	alert( errorMessage ) ;

	// HTMLに書き出し
	document.getElementById("result").innerHTML = errorMessage;
}

// オプション・オブジェクト
var optionObj = {
	"enableHighAccuracy": false ,
	"timeout": 8000 ,
	"maximumAge": 5000 ,
};