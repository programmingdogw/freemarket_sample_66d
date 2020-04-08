// カテゴリーのリンク関係。フォームのロジックを改修しながら記述する予定。
// 場合によっては１から作る可能性有。idの受け渡しとかはほぼそのまま行けると思うが


$(document).on('turbolinks:load', ()=> {
  $('.header__contents__bottom__left--tag').mouseover(function() {
 
    console.log('マウスオーバーしました！');
 
  });
  
});
