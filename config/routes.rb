Rails.application.routes.draw do

  
  root 'homepage#home'
  get '/about', to: 'homepage#about'
  get '/terms', to: 'homepage#terms'

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#logout'


  match 'auth/:provider/callback', to: 'sessions#facebook', as: 'facebook', via: [:get, :post]
  match 'auth/failure', to: redirect('/'),  via: [:get, :post]


  get 'signup', to: 'users#new'

  # Defining a member block inside a resource creates a route that can act on an individual member of that resource-based route: (https://riptutorial.com/ruby-on-rails/example/5680/member-and-collection-routes)

  resources :users, except: [:new] do 
    resources :products do 
      member do 
        put "like" => "products#like"
        
      end
    end
  end
  
  get 'comments/create'
  resources :products, only: [:show] do
    post "comments", to: "comments#create"
  end 

  resources :categories, except: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
