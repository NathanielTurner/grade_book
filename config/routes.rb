Rails.application.routes.draw do
  resources :teachers
  resources :parents
  resources :students
  root 'dash_board#show'
  get '/login' => 'login#login'
  post '/login' => 'login#login'
  get '/logout' => 'login#logout'

end
