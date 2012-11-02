xml.instruct!
xml.feed 'xmlns' => 'http://www.w3.org/2005/Atom' do
  xml.title data.site.name
  xml.id 'fu:#{data.site.url}'
  xml.link 'href' =>  data.site.url
  xml.link 'href' => data.site.feed_url, 'rel' => 'self', 'type' => 'application/atom+xml'
  xml.author {
    xml.name data.authors.negonicrac.feed_display
  }

  unless blog.articles.empty?
    xml.updated blog.articles.first.date.to_time.iso8601

    blog.articles[0..5].each do |article|
      xml.entry do
        xml.title article.title
        xml.link 'rel' => 'alternate', 'href' => "#{data.site.url}#{article.url}"
        xml.id "fu:negonicrac.com:#{article.url}"
        xml.published article.date.to_time.iso8601
        xml.updated article.date.to_time.iso8601
        xml.author { 
          xml.name article.author.feed_display
          xml.email article.author.email
          xml.uri article.author.url
        }
        #xml.summary article.summary, 'type' => 'html'
        xml.content article.body, 'type' => 'html'
      end
    end
  end
end

