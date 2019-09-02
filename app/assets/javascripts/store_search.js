$(document).on('keyup', '#exampleFormControlInput2', function(e){
  e.preventDefault();
  // 入力フォームの値の取得
  var input = $.trim($(this).val()); 
  // サービス選択候補の表示
  function appendStore(store){
              html = `<li id="liststore" data-store-id="${store.id}"data-store-name="${store.name}">
                        ${store.name} [${store.kind}]
                      </li>`
    $('#result').append(html);
  }
  // サービス名を入力欄に出力させ、実際に使用するidをhiddenfieldに入力をする
  function appendSelectedName(store_id,store_name){
    $("#exampleFormControlInput2").val(`${store_name}`);
    $("#exampleFormControlInput4").val(`${store_id}`);
  }
    // インクリメンタルサーチ
    $.ajax({
    url: '/stores/search',
    type: 'GET',
    data: ('keyword=' + input),
    processData: false,
    contentType: false,
    dataType: 'json'
    })
    .done(function(data){
      $('#result').find('li').remove();
      $(data).each(function(i, store){
        appendStore(store)
      });
    })
    // 候補を入力をされた場合、選択候補のフィールドを削除する
    $(document).on('click','#liststore', function(){
      var store_id = $(this).data('store-id');
      var store_name = $(this).data('store-name');
      appendSelectedName(store_id,store_name);
      $(this).parent().empty();
      })
    // ボタンを入力した場合、入力されているサービス名とidを初期化する
    $(document).on('click','#btn-service-delete', function(){
      $("#exampleFormControlInput2").val('');
      $("#exampleFormControlInput4").val('');
      })
});