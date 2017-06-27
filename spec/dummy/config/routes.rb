Rails.application.routes.draw do
  mount Crawler::Rails::Engine => "/crawler-rails"
end
