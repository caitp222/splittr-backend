Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #users
  resources :users, only: [:create, :show]
  get '/users/find' => 'users#find'

  #sessions
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'

  #memberships
  post '/memberships' => 'memberships#create'

  #groups
  resources :groups, only: [:show, :create]
  post '/groups/settle' => 'groups#settle'

  #expenses
  get '/groups/:group_id/expenses/:expense_id' => 'expenses#show'
  post '/groups/:id/expenses' => 'expenses#create'
  delete '/expenses/:id' => 'expenses#destroy'

end
