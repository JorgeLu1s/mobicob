Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'admin/campaigns#index'

  namespace :v1, defaults: { format: 'json' } do
    devise_scope :user do
      post '/sign_in', to: 'sessions#create'
    end

    get '/tasks', to: 'tasks#index'
    patch '/upload_tasks', to: 'tasks#upload_tasks'
    get '/params', to: 'params#index'
  end
end
