Rails.application.routes.draw do
  get "/howls", to: "howls#index" 
  get "/howls/top", to: "howls#top" 
  
  resources :howls do
    post :confirm, on: :collection
  end
  
end
