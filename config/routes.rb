Rails.application.routes.draw do
  get 'welcome/index' 
  # https://ruby-on-rails-austinpierce956002.codeanyapp.com/welcome/index

  root 'welcome#index'
  
 # root 'articles#index'
  
  resources :articles do
    resources :comments # nested resource
  end
  
end
