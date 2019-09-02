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

  function appendGoodScoring(positive_score){
    $("#exampleFormControlInput_good").val(`${positive_score}`);
  }

  function appendChanceScoring(positive_score){
    $("#exampleFormControlInput_chance").val(`${positive_score}`);
  }

  $(document).on('change', '#exampleFormControlTextarea1', function(){
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
      var positive_score = 50+50*polarity*magnitude
      console.log(`polarity:${res.documentSentiment.polarity}`);
      console.log(`magnitude:${res.documentSentiment.magnitude}`);
      $(ps).text(`positive score:${positive_score}`);

    appendGoodScoring(positive_score);

    }).fail(function(XMLHttpRequest, textStatus, errorThrown) {
     alert("error");
    })
  });

  $(document).on('change', '#exampleFormControlTextarea2', function(){
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
      var positive_score = 50+50*polarity*magnitude
      console.log(`polarity:${res.documentSentiment.polarity}`);
      console.log(`magnitude:${res.documentSentiment.magnitude}`);
      $(ps).text(`positive score:${positive_score}`);

      appendChanceScoring(positive_score);

    }).fail(function(XMLHttpRequest, textStatus, errorThrown) {
     alert("error");
    })
  });

});