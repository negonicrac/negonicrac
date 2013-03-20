jQuery ->
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
