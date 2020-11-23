Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/categories' => 'categories#index'
  get '/categories/show' => 'categories#show', as: 'show_category'
  get '/categories/new' => 'categories#new', as: 'new_category'
  post '/categories/create' => 'categories#create', as: 'create_category'
  get '/categories/edit' => 'categories#edit', as: 'edit_category'
  post '/categories/update' => 'categories#update', as: 'update_category'
  post '/categories/delete' => 'categories#delete', as: 'delete_category'
end
