window.TimeAgo =
  setup: ->
    jQuery.timeago.settings.allowFuture = true
    $('time.ago').timeago();

jQuery.timeago.settings.allowFuture = true

jQuery ->
  TimeAgo.setup()
