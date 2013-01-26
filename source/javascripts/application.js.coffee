#= require vendor/modernizr.custom.26373
#= require vendor/jquery.min
#= require vendor/jquery-ui-1.10.0.custom.min
#= require vendor/jquery.tmpl.min
#= require vendor/jquery.lifestream.min
#= require vendor/jquery.timeago
#= require vendor/jquery.fitvids
#= require bootstrap
#= require toISO8601
#= require lifestream
#= require timeago
#= require fitvids

jQuery ->
  $('.disqus-count').each ->
    element = $(this)
    s = document.createElement('script')
    s.async = true
    s.type = 'text/javascript'
    s.src = 'http://' + $('body').data('disqus-shortname') + '.disqus.com/count.js'
    (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);

  $('#disqus_thread').each ->
    $disqus_thread = $(this)

    disqus_shortname  = $('body').data('disqus-shortname')
    disqus_identifier = $disqus_thread.data('disqus-identifier')
    disqus_url = $disqus_thread.data('disqus-url')
    disqus_developer = $disqus_thread.data('disqus-development')

    dsq = document.createElement('script')
    dsq.type = 'text/javascript'
    dsq.async = true
    dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js'
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq)

  # Google page view tracking
  $('#google-analytics').each (index, element) ->
    $element = $(element)
   
    unless $element.hasClass('google-analytics-loaded')
      window._gaq = window._gaq || []

      google_account = $element.data('account')
      
      window._gaq.push(['_setAccount', google_account])
      window._gaq.push(['_trackPageview'])
      window._gaq.push(['_trackPageLoadTime'])

      Modernizr.load({
        load: '//www.google-analytics.com/ga.js'
      })

      $element.addClass('google-analytics-loaded')

  # Mailto tracking code
  $("a[href^=\"mailto:\"]").click ->
    window._gaq = window._gaq || []
    window._gaq.push ["_trackEvent", "Email", "Click", $(this).attr("href")]

  # Download Tracking Code
  $("a[href$=\"zip\"],a[href$=\"pdf\"],a[href$=\"doc\"],a[href$=\"docx\"],a[href$=\"xls\"],a[href$=\"xlsx\"],a[href$=\"ppt\"],a[href$=\"pptx\"],a[href$=\"txt\"],a[href$=\"csv\"]").click ->
    u = $(this).attr("href")

    window._gaq = window._gaq || []
    window._gaq.push ["_trackEvent", "Download", u.match(/[^.]+$/), u]

  # External link tracking code for old site
  $("a[href^=\"http\"]").click ->
    window._gaq = window._gaq || []
    window._gaq.push ["_trackEvent", "External Link", "Click", $(this).attr("href")]  unless @hostname is location.hostname
