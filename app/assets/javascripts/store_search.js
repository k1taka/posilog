$(document).on('keyup', '#exampleFormControlInput2', function(e){
  e.preventDefault();
  var input = $.trim($(this).val()); 

  function appendSelectedName(store_id,store_name){
    $("#exampleFormControlInput2").val(`${store_name}`);
    $("#exampleFormControlInput4").val(`${store_id}`);
  }

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
        $('#result').append(`<li id="liststore" data-store-id="${store.id}"data-store-name="${store.name}">` + store.name + '</li>')
      });
    })

    $(document).on('click','#liststore', function(){
      var store_id = $(this).data('store-id');
      var store_name = $(this).data('store-name');
      console.log(store_id)
      console.log(store_name)
      appendSelectedName(store_id,store_name);
      $(this).parent().remove();
      })
});