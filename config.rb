require "righthand/html"
require "righthand/helpers"
require "righthand/monkeypatches/blog_article"

helpers do
  include Righthand::Helpers::AuthorHelpers
  include Righthand::Helpers::DateHelpers
  include Righthand::Helpers::MetatagHelpers
end

activate :livereload
activate :directory_indexes

activate :blog do |blog|
  blog.permalink         = "/archive/:year/:month/:day/:title.html"
  blog.sources           = "posts/:year-:month-:day-:title.html"
  blog.layout            = "post"
  blog.default_extension = ".md"

  blog.taglink           = "/tags/:tag.html"
  blog.tag_template      = "tag.html"

  blog.year_link         = "/archive/:year.html"
  blog.month_link        = "/archive/:year/:month.html"
  blog.day_link          = "/archive/:year/:month/:day.html"
  blog.calendar_template = "calendar.html"
end

page "/manifest.appcache", layout: false
page "/atom.xml", layout: false
page "/sitemap.xml", layout: false
page "/humans.txt", layout: false
page "/disqus.html", layout: false, directory_index: false

ignore "javascripts/fitvids.js"
ignore "javascripts/lifestream.js"
ignore "javascripts/oembed.js"
ignore "javascripts/timeago.js"
ignore "javascripts/toISO8601.js"
ignore "javascripts/vendor/*"
ignore "images/mini-social-icons/*"

set :css_dir, "stylesheets"
set :js_dir, "javascripts"
set :images_dir, "images"
set :markdown_engine, :redcarpet
set :markdown, renderer: Righthand::HTML

configure :build do
  set :js_compressor, Uglifier.new(toplevel: false, unsafe: true, copyright: false)

  activate :smusher
  activate :minify_html
  activate :gzip
  activate :asset_hash
  activate :minify_css
  activate :minify_javascript
end
