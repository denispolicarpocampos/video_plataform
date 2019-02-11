// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require tether/dist/js/tether
//= require bootstrap/dist/js/bootstrap.bundle
//= require rails-ujs
//= require activestorage
//= require video.js/dist/video
//= require_tree .

$( document ).ready(function() {
  var player = videojs('my_video_1');
  var options = {};

  player.on('play', function() {
    $.ajax({
      type: 'POST',
      url:"/video_clicks/",
      dataType: 'json',
      data: {
        video_click: { video_id: window.location.pathname.split('/')[2] }
      },
      success: function(){
        $('span.video-count')[0].innerText = parseInt($('span.video-count').text()) + 1
      }
    });
  });

  function showCount(){
    var id = window.location.pathname.split('/')[2] 
    $.ajax({
      type: 'GET',
      url:"/video_clicks/"+id,
      dataType: 'json',
      success: function(data){
        $('span.video-count').text(data.counter)
      }
    });
  }
  showCount()
});