Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"

  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    # resources :doses, only: [:create, :new]
    resources :doses, only: [:create]
    # will pass it on the show without new html form
    resources :reviews, only: [:create]
  end
  # doses can be deleted separately
  resources :doses, only: [:destroy]
end

# GET "cocktails/42/doses/new"
# POST "cocktails/42/doses"

  # resources :cocktails, only: [:index, :show, :new, :create] do
  #   resources :doses, only: [:create]
  #   resources :reviews, only: [:create]
  # end
  # resources :doses, only: [:destroy]
