xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title @config[:title]
  xml.id @config[:url]
  xml.updated articles.first[:date].iso8601 unless articles.empty?
  xml.author { xml.name @config[:author] }

  articles.reverse[0...10].each do |article|
    xml.entry do
      xml.title article[:text_title]
      xml.id article.url
      xml.published article[:date].iso8601
      xml.updated article[:date].iso8601
      xml.author article[:author]
      xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end

