#{ service: "foursquare",   user: "negonicrac" },
#{ service: "forrst",       user: "negonicrac" },
LifeStream =
  setup: ->
    count = 0
    list =
      list =
        [
          { service: "twitter",      user: "negonicrac" },
          { service: "lastfm",       user: "negonicrac" },
          { service: "youtube",      user: "nnegonicrac" },
          { service: "github",       user: "negonicrac" },
          { service: "tumblr",       user: "negonicrac" },
          { service: "dribble",      user: "negonicrac" },
          { service: "googleplus",   user: "113192904857695283969" },
          { service: "googlereader", user: "17398064906584369885" }
        ]

    $("#sidebar #social #lifestream").lifestream
      limit: 10
      list: list
      feedloaded: ->
        count++
        if (count == list.length)
          $("#lifestream li").each ->
            element = $(this)
            date = new Date(element.data("time"))
            element.append(" <time class=\"published ago\" datetime=\"" + date.toISOString(date) + "\">" + date.toDateString() + "</time>")
          $("#lifestream time").timeago()

jQuery ->
  LifeStream.setup()

