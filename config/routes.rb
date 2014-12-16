Rails.application.routes.draw do

  devise_for :users

  filter :locale
  
  get '/sitemap' => "transactions#sitemap", :as => :sitemap

  resources :users, only: [:show]
  
  root "transactions#index"

  get "/:id" => "users#show", as: :user_by_permalink

end
