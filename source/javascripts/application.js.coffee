#= require vendor/modernizr
#= require vendor/jquery
#= require vendor/jquery-ui
#= require vendor/jquery.tmpl
#= require vendor/jquery.lifestream
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

  $('#google-analytics').each (index, element) ->
    $element = $(element)
   
    unless $element.hasClass('google-analytics-loaded')
      window._gaq = window._gaq || []

      google_account = $element.data('account')
      
      window._gaq.push(['_setAccount', google_account])
      window._gaq.push(['_trackPageview'])
      window._gaq.push(['_trackPageLoadTime'])

      #console.log(window._gaq)
      #console.log('google analytics loaded')
      #console.log($element.data('account'))
      #console.log($element)
      #console.log(index)

      Modernizr.load({
        load: '//www.google-analytics.com/ga.js'
      })

      $element.addClass('google-analytics-loaded')
