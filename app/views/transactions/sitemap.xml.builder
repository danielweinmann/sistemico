xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.url do
    xml.loc root_url
    xml.priority 1.0
    xml.changefreq "daily"
  end

  @users.each do |user|
    xml.url do
      xml.loc user_by_permalink_url(user)
      xml.priority 0.8
      xml.changefreq "daily"
      xml.lastmod Transaction.involving(user).order("updated_at DESC").limit(1).first.updated_at.to_date
    end
  end

end
