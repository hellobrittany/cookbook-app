Rails.application.routes.draw do
  get '/one_recipe_url' => 'recipes#one_recipe_action'

  get '/recipes' => 'recipes#index'
  get '/' => 'recipes#index'


  get '/recipes/new' =>  'recipes#new'
  post '/recipes' => 'recipes#create'

  get '/recipes/:id' => 'recipes#show'

  get '/recipes/:id/edit' => 'recipes#edit'
  patch '/recipes/:id' => 'recipes#update'

  delete '/recipes/:id' => 'recipes#destroy'

  


end  