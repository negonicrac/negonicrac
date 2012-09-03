require File.expand_path("../lib/lassitude_redcarpet_html", __FILE__)

module ::Middleman
  module Blog
    module BlogArticle
      def author
        a = data.author || "negonicrac"
        @app.data.authors[a]
      end

      def to_json
        serializable_hash.to_json
      end

      def published
        !!data.published
      end

      def comments
        !!data.comments
      end

      def serializable_hash(options = nil)
        {
          id: url.gsub(/.html$/,""),
          url: url.gsub(/.html$/,".json"),
          slug: slug,
          mime_type: mime_type,
          title: title,
          display_title: data["eng_title"] || title,
          date: date,
          published: data.published,
          comments: data.comments,
          tags: tags,
          summary: summary,
          body: body,
          author: {
            name: author.name,
            url: author.url,
            email: author.email
          }
        }
      end
    end
  end
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
set :markdown, renderer: LassitudeRedcarpetHTML

configure :build do
  set :js_compressor, Uglifier.new(toplevel: false, unsafe: true, copyright: false)

  activate :smusher
  activate :minify_html
  activate :gzip
  activate :asset_hash
  activate :minify_css
  activate :minify_javascript

  #deploy_configs = YAML::load_file(".fog.yml")
  #if deploy_configs
  #  activate :sync do |sync|
  #    sync.fog_provider          = deploy_configs[:provider] # Your storage provider
  #    sync.fog_directory         = deploy_configs[:bucket_name] # Your bucket name
  #    sync.fog_region            = deploy_configs[:bucket_region_name] # The region your storage bucket is in
  #    sync.aws_access_key_id     = deploy_configs[:aws_access_key_id] # Your Amazon S3 access key
  #    sync.aws_secret_access_key = deploy_configs[:aws_secret_access_key] # Your Amazon S3 access secret
  #    # sync.after_build         = true # Run sync after build
  #    sync.existing_remote_files = "keep" # What to do with your existing remote files? (keep or delete)
  #  end
  #end
end
