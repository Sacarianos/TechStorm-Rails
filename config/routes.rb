Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users
  resources :projects
  resources :collaborates
  resources :follows
  
get 'projects/:id/join' => 'projects#join'
get 'projects/:id/follow' => 'projects#follow'

end
