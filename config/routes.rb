Rails.application.routes.draw do
 

  get 'credit_card/new'
  get 'credit_card/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'

    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :users, except: [:index, :new] 
  
  resources :items do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end

    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }      
    end

    resources :purchases, only: [:index] do
      collection do
        post 'pay', to: 'purchases#pay'
        get 'done', to: 'purchases#done'
      end
    end

    get 'images/destroy'
    
  end
  

  
  root 'experiment#index'

  resources :experiment, only: [:index, :sample] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :credit_card, only: [:new, :show, :index] do
    collection do
      post 'show', to: 'credit_card#show'
      post 'pay', to: 'credit_card#pay'
      post 'delete', to: 'credit_card#delete'
    end
  end

  get 'sample', to: 'experiment#sample'
  get 'unexpectederrors', to: 'experiment#unexpectederrors'

end
