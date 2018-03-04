Rails.application.routes.draw do
  get 'welcome/index' 
  # https://ruby-on-rails-austinpierce956002.codeanyapp.com/welcome/index

  root 'welcome#index'
  
  resources :articles
  
end
