if Crawler::Rails::Site.exists?
  puts 'already exists data!'
  exit 0
end
site = Crawler::Rails::Site.create!(name: '東シナ海')
ps = site.page_sources.create!(name: '詳細ページ', url: 'google.com')
site.entries.create!(name: '入場金額', page_source_id: ps.id, scraping_code: '')
puts 'success!!'
