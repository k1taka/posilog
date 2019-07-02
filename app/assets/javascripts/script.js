const API_KEY = 'AIzaSyDMqw4Noq1VA4lCC2AeDwqEfbbwiTwoebY';

$(function(){
  $('#exampleFormControlTextarea2').on('change', function(){
    var chance_comment = $(this).prop('value');
    var requestUrl ='https://language.googleapis.com/v1beta1/documents:analyzeSentiment?key=' + API_KEY;

    $.ajax({
      url: requestUrl,
      type: "POST",
      contentType : "application/json; charset=utf-8",
      data        : JSON.stringify({
                        "document": {
                            "type": "PLAIN_TEXT",
                            "language": "ja",
                            "content": `${chance_comment}`
                        },
                        "encodingType": "UTF8"}),
                     })
    .done(function(res) {
      var polarity = res.documentSentiment.polarity
      var magnitude = res.documentSentiment.magnitude

      console.log(`polarity:${res.documentSentiment.polarity}`);
      console.log(`magnitude:${res.documentSentiment.magnitude}`);

      if (polarity >0.3) {
          alert("ok");
      }
      else{
          alert("ポジティブな投稿にしましょう");
      }

    }).fail(function(XMLHttpRequest, textStatus, errorThrown) {
     alert("error");
    })

  });
});