Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'authentication' => 'authentication#create'
      resources :users do
        resources :posts
      end
    end
  end
end
