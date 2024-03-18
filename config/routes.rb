Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :blog_posts

  # below is the same as resources line above
  # get "/blog_posts/new", to: "blog_posts#new", as: :new_blog_post
  # get "/blog_posts/:id/edit", to: "blog_posts#edit", as: :edit_blog_post
  # get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post
  # patch "/blog_posts/:id/", to: "blog_posts#update"
  # delete "/blog_posts/:id", to: "blog_posts#destroy"
  # post "/blog_posts", to: "blog_posts#create", as: :blog_posts

  # the as: allows the use of helpers like 
  #     blog_post_path(:id) => "/blog_posts/:id"
  #     and
  #     blog_post_url(:id) => http://localhost:3000/blog_posts/:id

  # Defines the root path route ("/")
  root "blog_posts#index"

end
