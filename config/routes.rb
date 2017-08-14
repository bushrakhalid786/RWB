Rails.application.routes.draw do
  resources :ad_replies
  resources :images
  resources :advertisements
  resources :categories
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_scope :user do
    get '/sign_up' => 'registrations#new', :as => :custom_registration
  end
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match "sign_up" => "registrations#new" , as: "custom_registration1",via: :get
  match "choose-category" => "home#choose_category" , as: "choose_category",via: :get
  match "/category/:alias_name" => "home#show_category_page" , as: "show_category_page",via: :get
  match "/category/:alias_name/:child_alias_name" => "home#show_category_page" , as: "show_category_page_with_children",via: :get
  match "/search"=> "home#search",via: [:get]
  root to: 'home#home'
end
