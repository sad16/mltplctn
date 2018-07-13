Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  mount ActionCable.server => '/cable'

  resources :multiplications, only: [:create, :show]
end
