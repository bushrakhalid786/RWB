Rails.application.routes.draw do
  resources :images
  resources :advertisements
  resources :categories
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match "choose-category" => "home#choose_category" , as: "choose_category",via: :get
  match "/category/:alias_name" => "home#show_category_page" , as: "show_category_page",via: :get
  match "/category/:alias_name/:child_alias_name" => "home#show_category_page" , as: "show_category_page_with_children",via: :get
  match "/search"=> "home#search",via: [:get,:post]
  root to: 'home#home'
end
