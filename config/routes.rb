Crawler::Rails::Engine.routes.draw do
  root 'sites#index'
  resources :sites do
    scope module: :sites do
      resources :page_sources
    end
  end
end
