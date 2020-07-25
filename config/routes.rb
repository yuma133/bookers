Rails.application.routes.draw do
  get '' => "books#start"
  get "books" => "books#index"
  get "books/:id" => "books#show"
  get "books/:id/edit" => "books#edit"
  post "books" => "books#create"
  patch "books/:id" => "books#update"
  delete "books/:id" => "books#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
