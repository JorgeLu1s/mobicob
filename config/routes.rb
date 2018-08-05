Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'admin/dashboard#index'

  namespace :v1, defaults: { format: 'json' } do
    devise_scope :user do
      post '/sign_in', to: 'sessions#create'
    end

    get '/assignments', to: 'assignments#index'
  end
end
