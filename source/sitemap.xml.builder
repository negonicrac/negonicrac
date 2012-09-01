xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc data.site.url
    xml.lastmod DateTime.now.strftime("%Y-%m-%d")
    xml.changefreq "daily"
    xml.priority 1
  end

  xml.url do
    xml.loc "#{data.site.url}#{sitemap.find_resource_by_path("/tags.html").url}"
    xml.lastmod DateTime.now.strftime("%Y-%m-%d")
    xml.changefreq "daily"
    xml.priority 1
  end

  xml.url do
    xml.loc "#{data.site.url}#{sitemap.find_resource_by_path("/archive.html").url}"
    xml.lastmod DateTime.now.strftime("%Y-%m-%d")
    xml.changefreq "daily"
    xml.priority 1
  end

  unless blog.tags.empty?
    blog.tags.each do |tag|
      xml.url do
        xml.loc "#{data.site.url}#{sitemap.find_resource_by_path(tag_path(tag[0])).url}"
        xml.lastmod tag[1][0].date.to_time.iso8601
        xml.changefreq "daily"
        xml.priority 0.8
      end
    end
  end

  unless blog.articles.empty?
    blog.articles.each do |article|
      xml.url do
        xml.loc "#{data.site.url}#{article.url}"
        xml.lastmod article.date.to_time.iso8601
        xml.changefreq "weekly"
        xml.priority 0.8
      end
    end
  end
end


