Rails.application.routes.draw do
  scope '/api/:api_version' do
    get 'enterprises', to: 'enterprises#index', as: 'enterprises'
    get 'enterprises/:id', to: 'enterprises#show', as: 'enterprise'
  end
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
