Rails.application.routes.draw do
  resources :contacts
  root "howls#top"
  get "/howls", to: "howls#index"

  resources :howls do
    post :confirm, on: :collection
  end

  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
