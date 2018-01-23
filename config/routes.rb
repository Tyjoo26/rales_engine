Rails.application.routes.draw do




  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      namespace :invoices do
        get '', to: 'invoices#index'
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/:id', to: 'invoices#show'
      end
      namespace :items do
        get '', to: 'items#index'
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/:id', to: 'items#show'
      end
    end
  end
end
