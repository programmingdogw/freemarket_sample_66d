window.addEventListener("load", function() {
  // タブのDOM要素を取得し、変数で定義
  var tabs = $(".mypage-tab-btn");
  // tabsを配列に変換する
  tabsAry = Array.prototype.slice.call(tabs);

  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch() {
    console.log(this);
    // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
    $(".active")[0].classList.remove("active");
    // クリックしたタブにactiveクラスを追加
    $(this).addClass("active");

    // コンテンツの全てのshowクラスのうち、最初の要素を削除
    $(".show")[0].classList.remove("show");

    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabs.index(this);

    // クリックしたcoutentクラスにshowクラスを追加する
    $(".mypage-item-list")[index].classList.add("show");
  }

  // タブメニューの中でクリックイベントが発生した場所を探し、下で定義したtabSwitch関数を呼び出す
  tabsAry.forEach(function(value) {
    // タブメニューの中でクリックイベントが発生した場所を探し、下で定義したtabSwitch関数を呼び出す
    value.addEventListener("click", tabSwitch);
  });

  $(function() {
    console.log($(".mypage-tab-btn"));
  });

});