Toolbox = {}
timezoneJS.timezone.zoneFileBasePath = 'tz';
timezoneJS.timezone.init();

Toolbox.HUMANTIME = '%a, %d %b \'%y %I:%M:%S %p';
Toolbox.TIMEZONE  = '%Z (%z)';
Toolbox.data = {}


change_timezone =->
  Toolbox.tz = $(".selectpicker").val()
  console.log Toolbox.tz
  tell_time()

current_timezone = ->
  date_object = new Date()
  date_object.strftime(Toolbox.TIMEZONE)

tell_time = ->
  time = $("#main-timestamp-box").val()
  if Toolbox.tz
    date_object = new timezoneJS.Date(time*1000, Toolbox.tz)
  else
    date_object = new timezoneJS.Date(time*1000)

  $("#response-text").html(date_object._dateProxy.strftime(Toolbox.HUMANTIME))
  $("#response-tz select").val("America/Los_Angeles")

$(document).ready ->
  $("#main-timestamp-box").bind 'keyup', tell_time
  $("#main-timestamp-box").bind 'keydown', tell_time
  $("#main-timestamp-box").bind 'blur', tell_time
  $(".selectpicker").bind 'change', change_timezone
  $(".selectpicker").bind 'blur', change_timezone


  current_time = new Date().getTime()
  $("#main-timestamp-box").val(Math.floor(current_time/1000))
  tell_time()
  $('.selectpicker').selectpicker();
