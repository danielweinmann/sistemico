Rails.application.routes.draw do

  devise_for :users

  filter :locale
  
  get '/sitemap' => "transactions#sitemap", :as => :sitemap
  
  root "transactions#index"

end
