Rails.application.routes.draw do
  root "howls#top"
  get "/howls", to: "howls#index" 
  # get "/howls/top", to: "howls#top" 
  
  resources :howls do
    post :confirm, on: :collection
  end
  
  
  
end
