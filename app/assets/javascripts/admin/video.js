function validationForm(e){
  var url = $('#video_url').val();
  var name = $('#video_name').val();
  validationName(name, e)
  validationUrl(url, e)
}

function validationName(name, e){
  if(!name){
    e.preventDefault()
    var msg = 'A nome é obrigatório!'
    $('.error-name').text(msg)
  }else{
    $('.error-name').text('')
  }
}

function validationUrl(url, e){
  $('.error-url').text('')
  var msg = ''
  if(url){
    if (!url.startsWith("http://") || !url.startsWith("https://")){
      var msg = 'Sua url deve começar com http ou https!'
    }

    if (!url.endsWith('.m3u8')){
      var msg = 'Sua url deve terminar com .m3u8'
    }

  }else{
    var msg = 'A url é obrigatória!'
  }

  if(msg){
    e.preventDefault()
    $('.error-url').text(msg)
    return false
  }
}