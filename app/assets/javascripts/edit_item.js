$(document).on('turbolinks:load', ()=> {
 
  
  // こっから先はカテゴリーのフォームに関する記述

  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>                        
                          <select class="listing-select-wrapper__box--select" id="child_category" name="item[childcategory]">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>                                                 
                      </div>`;
    $('.listing-product-detail__category').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成 
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='listing-select-wrapper__added' id= 'grandchildren_wrapper'>                            
                                <select class="listing-select-wrapper__box--select" id="grandchild_category" name="item[category_id]">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>                                                           
                            </div>`;
    $('.listing-product-detail__category').append(grandchildSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#edit_parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'edit_category_children',
        type: 'Post',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#edit_children_wrapper').remove(); //親が変更された時、子以下を削除する
        $('#edit_grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#edit_children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除する
      $('#edit_grandchildren_wrapper').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.listing-product-detail__category').on('change', '#edit_child_category', function(){
    var childId = $('#edit_child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != "---"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'edit_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#edit_grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除する
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#edit_grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
    }
  });


});
