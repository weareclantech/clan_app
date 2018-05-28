Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  # devise_for :users
  root to: 'pages#home'
  post :access_request, controller: :accesses, action: :access_request
end
