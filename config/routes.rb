Rails.application.routes.draw do
  scope '/api/:api_version/users' do
    mount_devise_token_auth_for 'User', at: 'auth'
  end

  scope '/api/:api_version' do
    get 'enterprises', to: 'enterprises#index', as: 'enterprises'
    get 'enterprises/:id', to: 'enterprises#show', as: 'enterprise'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
