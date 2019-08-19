Rails.application.routes.draw do
  root 'users#new'
  resources :contacts
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :sessions, only:[:new, :create, :destroy]
  resources :users, except:[:index]
  resources :posts do
    collection do
      post :confirm
    end
    member do
      get :favorite
    end
  end
end
