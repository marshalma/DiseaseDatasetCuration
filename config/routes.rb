Rails.application.routes.draw do
<<<<<<< HEAD

  get 'diseases/index'
  get 'diseases/import'


=======
  get 'diseases/index'
  get 'diseases/import'
>>>>>>> 63649ed519146316347eff414d53c9af8b62fa52
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
