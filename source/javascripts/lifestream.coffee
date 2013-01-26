LifeStream =
  setup: ->
    count = 0
    list =
      list =
        [
          { service: 'googleplus', user: '113192904857695283969', key: 'AIzaSyCB8pKtPwGWkOMfe49CopUM40F6seVv5AE' },
          { service: 'twitter',    user: 'negonicrac' },
          #{ service: 'youtube',    user: 'nnegonicrac' },
          { service: 'github',     user: 'negonicrac' },
          #{ service: 'tumblr',     user: 'negonicrac' },
          { service: 'lastfm',     user: 'negonicrac' }
          #{ service: 'dribble',    user: 'negonicrac' }
        ]

    $('#sidebar #social #lifestream').lifestream
      limit: 10
      list: list
      feedloaded: ->
        count++
        if (count == list.length)
          $('#sidebar #social #lifestream li').each ->
            element = $(this)
            date = new Date(element.data('time'))
            element.append(' <time class="published ago" datetime="' + date.toISOString(date) + '">' + date.toDateString() + '</time>')
          $('#sidebar #social #lifestream time').timeago()
          $('#sidebar #social').slideDown()

jQuery ->
  LifeStream.setup()

