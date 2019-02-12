function validationForm(e){
  var url = $('#video_url').val();
  var name = $('#video_name').val();
  validationName(name, e)
  validationUrl(url, e)
}

function validationName(name, e){
  if(!name){
    e.preventDefault()
    $('.error-name')[0].innerText = 'A nome é obrigatório!'
  }else{
    $('.error-name')[0].innerText = ''
  }
}

function validationUrl(url, e){
  if(url){
    if (url.startsWith("http://") || url.startsWith("https://")){
      $('.error-url').text('')
    }else{
      e.preventDefault()
      $('.error-url').text('Sua url deve começar com http ou https!')
      return false
    }

    if (!url.endsWith('.m3u8')){
      e.preventDefault()
      $('.error-url').text('Sua url deve terminar com .m3u8!')
      return false
    }else{
      $('.error-url').text('')
    }
  }else{
    e.preventDefault()
    $('.error-url').text('A url é obrigatória!')
  }
}