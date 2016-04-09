Rails.application.routes.draw do
  get 'diseases/index'

  get 'diseases/import'

  resources :diseases do
    collection { post :import}
  end

  root 'users#new'
  get 'signup'  => 'users#new'
  resources :users
end
