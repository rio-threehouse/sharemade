// jquery書きはじめ
$(function (){
  // 処理
  var count = $(".js-text").text().replace(/\r?\n/g, "改行").length;
  var now_count = 150 - count;
  $(".js-text-count").text( "のこり" + now_count + "文字");

  $(".js-text").on("keyup", function() {
    var count = $(this).val().replace(/\r?\n/g, "改行").length;
    var now_count = 150 - count;
    
    // バリデーションの値を変数に入れたい 最大●文字、のところにクラスを当てて、textを取得して変数に入れる
    // 問題 改行はにも自分プラスする！
    if (count > 150) {
      $(".js-text-count").css("color","red");
      $(".js-text-count").text( now_count + "文字オーバー");
    } else {
      $(".js-text-count").css("color","black");
      $(".js-text-count").text( "のこり" + now_count + "文字");
    }
  });
});
