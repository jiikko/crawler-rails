Crawler::Rails::Engine.routes.draw do
  root 'sites#index'
  resources :sites do
    post :crawl, on: :member
    scope module: :sites do
      resources :page_sources, only: %i(new create edit update)
      resources :entries, only: %i(new create edit update) do
        post :test_run, on: :collection
      end
    end
  end
  resources :crawling_jobs, only: %i(show)
end
