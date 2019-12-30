$(function(){
  $('#tweet_image').change(function(){
    var file = $('input[type="file"]').prop('files')[0];
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      var src = fileReader.result;
      var html= `<img class="image_preview" src="${src}">`;
      $(".image_preview").remove() 
      $('.image_label').append(html);
    }
    fileReader.readAsDataURL(file);
  });

  $('#user_image').change(function(){
    var file = $('input[type="file"]').prop('files')[0];
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      var src = fileReader.result;
      var html= `<img class="icon" src="${src}">`;
      $(".icon").remove() 
      $('.icon_area').append(html);
    }
    fileReader.readAsDataURL(file);
  });
});