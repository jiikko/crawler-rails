module Crawler::Rails
  class CrawlingJob < ApplicationRecord
    belongs_to :site

    has_many :crawling_logs

    scope :success, ->(){
      where(success: true)
    }
    scope :failure, ->(){
      where(success: false)
    }
    scope :latests_per_site, ->() {
      join_sql = <<-SQL
inner join (
  select max(id) as id
  from crawler_rails_crawling_jobs
  group by site_id
) c on crawler_rails_crawling_jobs.id = c.id
      SQL
      Crawler::Rails::CrawlingJob.joins(join_sql).select(:id, :site_id, :created_at)
    }
  end
end
