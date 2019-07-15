$(function(){
  function buildHTML(message){
    var html = `<div class="message" data-id= ${message.id}>
                  <div class="message__uper-info">
                    <p class="message__text__content">
                      ${content}
                    </p>
                      ${img}
                </div>`
    return html;
  }

  $('.form-control-posinega').on('change', function(){
    var chance_comment = $(this).prop('value');
    var ps = $(this).prev();
    API_KEY = gon.API_KEY;

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
          alert("OK");
          $(ps).text(`positive score:${res.documentSentiment.polarity}`);
        }
      else{
          alert("ポジティブな投稿にしましょう");
          $(ps).text(`positive score:${res.documentSentiment.polarity}`);
      }
    }).fail(function(XMLHttpRequest, textStatus, errorThrown) {
     alert("error");
    })
  });
});