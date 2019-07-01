// $(function() {
//   $("btn-primary").on("submit", function() {
//     console.log("送信ボタンが押されました");
//   });
// });

$(function(){
  $('#exampleFormControlTextarea2').on('change', function(){
    var chance_comment = $(this).prop('value');
    console.log(chance_comment);
  });
});