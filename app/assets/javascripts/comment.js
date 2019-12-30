$(function(){

  function buildHTML(comment){
    var html = `<p>
                  <strong>
                    <a href=/users/${comment.user_id}>${comment.user_name}</a>
                    ：
                  </strong>
                  ${comment.content}
                </p>`
    return html;
  }

  $('#new_comment').on('submit', function(e){
    $(".error").remove()
    if($("#comment_content").val()==""){
      var error_message = '<span class="error">メッセージを入力してください</span>';
      $(".comment_form").after(error_message);
      $('.form__submit').prop('disabled', false);
      return false;
    }else{
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action');
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data){
        var html = buildHTML(data);
        $('.comments').append(html);
        $('.form__submit').prop('disabled', false);
        $('.textbox').val('');
      })
      .fail(function(){
        alert('error');
      })
    }
  })
})
