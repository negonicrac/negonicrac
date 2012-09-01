window.TimeAgo =
  setup: ->
    jQuery.timeago.settings.allowFuture = true
    $("time.ago").timeago();

jQuery ->
  TimeAgo.setup()
