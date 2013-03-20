jQuery ->
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
