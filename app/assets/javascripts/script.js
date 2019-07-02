const API_KEY = 'AIzaSyDMqw4Noq1VA4lCC2AeDwqEfbbwiTwoebY';

$(function(){
  $('#exampleFormControlTextarea2').on('change', function(){
    var chance_comment = $(this).prop('value');
    console.log(chance_comment);

    var requestUrl ='https://language.googleapis.com/v1beta1/documents:analyzeSentiment?key=' + API_KEY;


    $.ajax({
      url: requestUrl,
      type: "POST",
      contentType : "application/json; charset=utf-8",
      data        : 
      JSON.stringify({
          "document": {
              "type": "PLAIN_TEXT",
              "language": "ja",
              "content": `${chance_comment}`
          },
          "encodingType": "UTF8"}),
    })
    .done(function(res) {
      alert("ok");
      // console.log(res);
      // var score = $(res).text(documentSentiment.score);
      // console.log(score);
      console.log(res.documentSentiment.magnitude);


    }).fail(function(XMLHttpRequest, textStatus, errorThrown) {
     alert("error");
    })

  });
});