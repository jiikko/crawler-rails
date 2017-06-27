Crawler::Rails::Engine.routes.draw do
  root 'sites#index'
  resources :sites
end
