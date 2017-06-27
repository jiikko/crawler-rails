Crawler::Rails::Engine.routes.draw do
  root 'sites#index'
  resources :sites do
    scope module: :sites do
      resources :page_sources, only: %i(new create edit update)
      resources :entries, only: %i(new create edit update)
    end
  end
end
