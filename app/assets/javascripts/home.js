$( document ).on('turbolinks:load', function() {
  $('.search-button').on('click', function(){
    if($('#email').val()){
      window.location.href = "/search_users?email="+$('#email').val()
    } else {
      $('.error-search')[0].innerText = 'Email inválido!'
    }
  })
})