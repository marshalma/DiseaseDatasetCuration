Rails.application.routes.draw do
  get 'diseases/index'
  get 'diseases/import'
  resources :diseases do
    collection { post :import}
  end


  root 'sessions#new'
  get 'signup'  => 'users#new'
  resources :users

  # Sessions
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
end
