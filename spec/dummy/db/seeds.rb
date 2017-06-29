if Crawler::Rails::Site.exists?
  puts 'already exists data!'
  exit 0
end
site = Crawler::Rails::Site.create!(name: '東シナ海')
ps = site.page_sources.create!(name: '詳細ページ', url: 'https://www.city.sapporo.jp/zoo')
scraping_code = <<-EOH
->(doc) {
 doc.search('.lnavi_top_cnt ul li').first.text
}
EOH
site.entries.create!(name: '年間パスポート料金',
                     page_source_id: ps.id,
                     scraping_code: scraping_code)

scraping_code = <<-EOH
->(doc) {
 doc.search('.lnavi_top_cnt ul li').first(2).last.text
}
EOH
site.entries.create!(name: '大人料金',
                     page_source_id: ps.id,
                     scraping_code: scraping_code)


scraping_code = <<-EOH
->(doc) {
 doc.search('.lnavi_top_cnt ul li').first(3).last.text
}
EOH
site.entries.create!(name: '小人料金',
                     page_source_id: ps.id,
                     scraping_code: scraping_code)


scraping_code = <<-EOH
->(doc) {
 doc.search('.lnavi_top_cnt ul li').first(4).last.text
}
EOH
site.entries.create!(name: '団体',
                     page_source_id: ps.id,
                     scraping_code: scraping_code)


site = Crawler::Rails::Site.create!(name: '旭山動物園')
ps = site.page_sources.create!(name: '詳細ページ', url: 'http://www.city.asahikawa.hokkaido.jp/asahiyamazoo/generalinformation/d052849.html')
scraping_code = <<-EOH
->(doc) {
 doc.search("table:nth(1) tr:nth(2) td:nth(2)").text
}
EOH
site.entries.create!(name: '大人（高校生以上） 料金',
                     page_source_id: ps.id,
                     scraping_code: scraping_code)

puts 'success!!'
