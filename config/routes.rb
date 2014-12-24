Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, :skip => [:sessions, :registration]

  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  filter :locale, exclude: /^\/users\/auth\/facebook/
  
  resources :transactions, only: [] do
    member do
      put :approve
      put :reject
    end
  end

  resources :users, only: [:index, :show] do
    resources :transactions, controller: 'users/transactions', only: [:new, :create]
  end
  
  get '/sitemap' => "transactions#sitemap", :as => :sitemap
  root "transactions#index"
  get "/:id" => "users#show", as: :user_by_permalink

end
