Toolbox = {}

Toolbox.HUMANTIME = '%a, %d %b \'%y %I:%M:%S %p';
Toolbox.TIMEZONE  = '%Z (%z)';

tell_time = ->
  time = $("#main-timestamp-box").val()
  date_object = new Date(time*1000)
  $("#response-text").html(date_object.strftime(Toolbox.HUMANTIME))
  $("#response-tz").html(date_object.strftime(Toolbox.TIMEZONE))

$(document).ready ->
  $("#main-timestamp-box").bind 'keyup', tell_time
  $("#main-timestamp-box").bind 'keydown', tell_time
  $("#main-timestamp-box").bind 'blur', tell_time

  current_time = new Date().getTime()
  $("#main-timestamp-box").val(Math.floor(current_time/1000))
  tell_time()