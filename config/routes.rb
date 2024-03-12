Rails.application.routes.draw do
  # Create a constraint to check if the user is logged in
  constraints ->(request) { request.env['warden'].user } do
    #              ☝🏻 current HTTP request object
    #                  Returns Raw Reck Env: Rack is a low-level interface between web servers that support Ruby and Ruby frameworks.
    #                          ☝🏻 Essentially, every Rails application is also a Rack application
    #                         .user fetches the currently authenticated user
    root to: 'pages#dashboard', as: :authenticated_root
  end

  # If not authenticated, route to the home page
  root to: 'pages#home'

  get 'goals', to: 'pages#dashboard'

  get 'goals/edit_date/:id', to: 'goals#edit_date', as: "edit_date"

  devise_for :users

  resources :goals, except: %i[index destroy] do
    resources :tasks, except: %i[show new]
  end

  get '/archive', to: 'goals#archive'

  get '/pomodoro', to: 'pages#pomodoro'
end
