Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'authentication', to: 'authentication#create'
      resources :users do
        resources :posts
        member do
          post 'follow', to: 'users#follow'
          delete 'unfollow', to: 'users#unfollow'
        end
      end
    end
  end
end
