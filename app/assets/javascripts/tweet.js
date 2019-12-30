$(function() {
  $("#tweet_form").on('submit',function(e){
    if($("#tweet_content").val()==""){
      var error_message = '<span class="error">取り組み内容を入力してください</span>';
      $(".error").remove()    
      $('.tweet_content').after(error_message);
      return false; 
    }
  });
});
