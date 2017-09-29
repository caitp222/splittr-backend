Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #users
  resources :users, only: [:new, :create, :show]
  get '/users/find' => 'users#find'

  #sessions
  resources :sessions, only: [:new, :create]
  delete '/sessions' => 'sessions#destroy'

  #memberships
  post '/memberships' => 'memberships#create'

  #groups
  resources :groups, only: [:show, :new, :create]
  post '/groups/settle' => 'groups#settle'

  #expenses
  get '/groups/:id/expenses/:id' => 'expenses#show'
  get '/groups/:id/expenses/new' => 'expenses#new'
  post '/groups/:id/expenses' => 'expenses#create'

end
