$(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
  const buildFileField = function(index){
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][image]"
                    id="item_images_attributes_${index}_image"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  };

  // 一旦画像のビルドコメントアウト
  // const buildImg = (index, url)=> {
  //   const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
  //   return html;
  // };



  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  // 削除ボックス隠しとく
  $('.hidden-destroy').hide();

  // フォームに変更があると次のフォームを作成
  $('#image-box').on('change', '.js-file', function(e) {
  
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();

    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    
  });
  
  // 削除を押すとjs-file_groupを削除
  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });


  // 削除を押すと:_destroyを送るためのチェックボックスにこっそりチェックが入る
  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index')
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    (省略)
  });

  
});
