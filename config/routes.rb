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

  devise_for :users

  resources :goals do
    resources :subtasks, except: %i[index show]
  end
end
