Rails.application.routes.draw do

  # get 'cocktails/index', to: 'cocktails#index', as: ''
  # get 'cocktails/create'
  # get 'cocktails/new'
  # get 'cocktails/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :doses, only: [:destroy]
end


