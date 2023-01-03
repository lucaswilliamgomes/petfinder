Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      # resources :users, param: :_username
      # get '/users/:username', to: 'users#show'
      post '/signup', to: 'users#create'
      post '/login', to: 'authentication#login'
      resources :animals
    end
  end
end
