Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :incidents
  root to: 'incidents#index'

  namespace :admin do
    root to: 'incidents#index'
    resources :incident_types
    resources :incidents
  end

  namespace :api do
    namespace :private do
      namespace :v1 do
        resources :incidents, only: %i[index update destroy]
        get 'incident_types' => 'incident_types#index'
        get 'incidents' => 'incidents#index'
        post 'incidents' => 'incidents#create'
        post 'login' => 'credentials#login'
      end
    end
  end
end