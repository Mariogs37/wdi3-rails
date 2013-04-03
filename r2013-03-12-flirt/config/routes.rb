R20130312Flirt::Application.routes.draw do
  root :to => 'home#index'
  resources :subscribers, :only => [:new, :create]
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
