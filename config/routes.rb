Rails.application.routes.draw do

  root 'posts#index'
  # ROUTES FOR HOME
  get '/home' => 'home#home'
  get '/about' => 'home#about'

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :posts do
    resources :comments
    resources :favourites, only: [:create, :destroy]
  end

  resources :favourites , only: [:index]

  # OLD ROUTES FOR POSTS
  # post 'posts/search' => 'posts#search'
  # GET form to create post
  # get '/posts/new' => 'posts#new', as: :new_post
  # POST a post
  # post '/posts'  => 'posts#create', as: :posts
  # # show post after creation
  # get '/posts/:id' => 'posts#show', as: :post
  # # GET form to edit a post
  # get '/posts/:id/edit' => 'posts#edit',  as: :edit_post
  # # PATCH the update to the post
  # patch '/posts/:id' => 'posts#update'
  # # GET all posts
  # get '/posts'  => 'posts#index'
  # # DELETE a specific post
  # delete '/posts/:id' => 'posts#delete'
  #
  # # OLD ROUTES FOR COMMENTS
  # get '/comments/new' => 'comments#new', as: :new_comment
  # post '/comments' => 'comments#create', as: :comments
  # get '/comments/:id' => 'comments#show', as: :comment
  # get '/comments/:id/edit' => 'comments#edit', as: :edit_comment
  # patch '/comments/:id' => 'comments#update'
  # get '/comments' => 'comments#index'
  # delete '/comments/:id' => 'comments#delete'


end
