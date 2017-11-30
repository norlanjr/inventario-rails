Rails.application.routes.draw do
  

  
  resources :payments
  
  resources :bills do
    resources :detail_invoices, only: [:create,:destroy, :update]
  end
  
  resources :clients
  resources :purchases

  resources :entries do
    resources :details, only: [:create,:destroy, :update]
  end
  #Utlizams los Recursos Compartidos 
  #detalle venta se convierte en sub recursis de la venntas
  #end de los Recursos Compartidos

  
  
  
  
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
