Rails.application.routes.draw do
  resources :songs# , only: [:index, :show, :new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # patch 'songs/:id', to: 'songs#update'
  # delete 'songs/:id', to: 'songs#destroy'
  root 'songs#index'
end
