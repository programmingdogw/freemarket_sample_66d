Rails.application.routes.draw do
  devise_for :users
  root 'experiment#index' 
  
end
