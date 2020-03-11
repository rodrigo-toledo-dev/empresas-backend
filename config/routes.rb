Rails.application.routes.draw do
  get 'companies/index', as: 'companies'
  get 'companies/show/:id', to: 'companies#show', as: 'company'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
