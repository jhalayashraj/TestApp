Rails.application.routes.draw do
  resources :reviews
  resources :profiles
  resources :posts do
  	resources :comments
  end
  resources :likes

  get 'static/home'

  devise_for :users #, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/content_validator" => "posts#content_validator"
  get "/content_validator_comment" => "comments#content_validator_comment"
  root to: 'posts#index'

end
