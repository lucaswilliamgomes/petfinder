Rails.application.routes.draw do
  resources :users, param: :_username
  post '/login', to: 'authentication#login'
  get '/a*', to: 'aplication#not_found'

  namespace 'api' do
    namespace 'v1' do
      resources :animals
    end
  end
end
