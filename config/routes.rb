Rails.application.routes.draw do
  devise_for :users
  resources :articles
  
  resources :providers
=begin
   Todas esta son acciones "CRUD"
   get "/articles"
   post "/articles"
   delete "/articles"
   get "/articles/:id"
   get "/articles/new"
   get "/articles/:id/edit"
   patch "/articles/:id"
   put"/articles/:id"
=end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
