Constants = {}

Constants.HUMANTIME = 'MMMM Do YYYY, h:mm:ss a';
Constants.TIMEZONE  = '%Z (%z)';
Constants.data = {}

tell_time = ->
  time = $("#main-timestamp-box").val()
  zone = $(".selectpicker").val()
  console.log $("#response-tz select").val()
  now = moment.unix(time)

  $("#response-text").html(moment.unix(time).tz(zone).format(Constants.HUMANTIME))

$(document).ready ->
  $("#main-timestamp-box").bind 'keyup', tell_time
  $("#main-timestamp-box").bind 'keydown', tell_time
  $("#main-timestamp-box").bind 'blur', tell_time
  $(".selectpicker").bind 'change', tell_time
  $(".selectpicker").bind 'blur', tell_time

  current_time = new Date().getTime()
  $("#main-timestamp-box").val(Math.floor(current_time/1000))
  tell_time()
  $('.selectpicker').selectpicker();
