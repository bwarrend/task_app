Rails.application.routes.draw do
  resources :tasks
  resources :users
  get '', to: 'sessions#welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'complete', to: 'tasks#complete'
  get '/sort_by_category', to: 'sessions#sort_by_category'
  get '/sort_by_title', to: 'sessions#sort_by_title'
  get '/sort_by_created_at', to: 'sessions#sort_by_created_at'
  get '/sort_by_due_date', to: 'sessions#sort_by_due_date'
  get '/toggle_show_complete', to: 'sessions#toggle_show_complete'
  get '/toggle_show_incomplete', to: 'sessions#toggle_show_incomplete'
  get '/group_by_date', to: 'sessions#group_by_date'
  get '/sort_by_status', to: 'sessions#sort_by_status'
  get '/sort_by_description', to: 'sessions#sort_by_description'
  get '/mark_complete', to: 'tasks#mark_complete'
  post '/tasks/:id(.:format)', to: 'tasks#complete'
  get '/users', to: 'users#index'

end
