Oembed =
  setup: ->
    $(".embed").oembed(null,{
      embedMethod: "fill",
      afterEmbed: ->
        $(".fluid-video, .oembedall-container, .embed").fitVids()
    })

jQuery ->
  Oembed.setup()
