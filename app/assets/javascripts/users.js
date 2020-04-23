$(function(){
  // タブのDOM要素を取得し、変数で定義
  let tabs = $(".mypage-tab-btn");
      itemtabs = $(".mypage-itemtab-btn");

  // タブメニューの中でクリックイベントが発生したらtabSwitch関数を呼び出す
  $('.mypage-tab-btn').on('click', function() {
    // 全てのactiveクラスのうち、最初の要素を削除
    $(".active").removeClass("active");
    // クリックしたタブにactiveクラスを追加
    $(this).addClass("active");
    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabs.index(this);
    // クリックしたクラスに最初のshowクラスを削除して追加する
    $(".mypage-event-list").removeClass("show").eq(index).addClass('show');
  })

  $('.mypage-itemtab-btn').on('click', function() {
    
    $(".action").removeClass("action");
    
    $(this).addClass("action");
    
    const index = itemtabs.index(this);

    $(".mypage-item-list").removeClass("look").eq(index).addClass('look');
  })
});
