Rails.application.routes.draw do
  root 'users#new'
  resources :sessions, only:[:new, :create, :destroy]
  resources :users, except:[:index]
  resources :posts do
    collection do
      post :confirm
    end
  end
end
