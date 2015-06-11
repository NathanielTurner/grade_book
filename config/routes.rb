Rails.application.routes.draw do
  resources :teachers
  resources :parents
  resources :students
  root 'dash_board#show'
  get '/login' => 'login#login'
  post '/login' => 'login#login'
  get '/logout' => 'login#logout'
  get '/parent' => 'dash_board#parent'
  get '/student' => 'dash_board#student'
  get '/teacher' => 'dash_board#teacher'
end
