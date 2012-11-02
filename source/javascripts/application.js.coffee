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

  $('#search-results').each ->
    $element = $(this)
    $.getScript('http://www.google.com/jsapi', success: ->
      google.load('search', '1', {language : 'en'})

      $element.find('#cse-search-box').hide();

      getQuery = () ->
        url = '' + window.location
        queryStart = url.indexOf('?') + 1

        if (queryStart > 0)
          parts = url.substr(queryStart).split('&')
          decodeURIComponent(part.split('=')[1].replace(/\+/g, ' ')) for part in parts when part.length > 7 and part.substr(0, 7) == 'search='

        ''

      callback = () ->
        customSearchControl = new google.search.CustomSearchControl('{{site.google.custom_search_id}}')
        customSearchControl.setResultSetSize(google.search.Search.FILTERED_CSE_RESULTSET)
        customSearchControl.draw('cse')
        customSearchControl.execute(getQuery())

      google.setOnLoadCallback callback, true
    )

