Rails.application.routes.draw do




  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '', to: "merchants#index"
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
        get '/revenue', to: ""
        get '/:id', to: "merchants#show"
        get '/:id/favorite_customer', to: "favorite_customer#show"
      end
      namespace :customers do
        get '', to: "customers#index"
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
        get '/:id', to: "customers#show"
      end
      namespace :transactions do
        get '', to: "transactions#index"
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
        get '/:id', to: "transactions#show"
      end
      namespace :invoices do
        get '', to: 'invoices#index'
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: "random#show"
        get '/:id', to: 'invoices#show'
      end
      namespace :items do
        get '', to: 'items#index'
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: "random#show"
        get '/most_revenue', to: "revenue#index"
        get '/:id', to: 'items#show'
      end
      namespace :invoice_items do
        get '', to: 'invoice_items#index'
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: "random#show"
        get '/:id', to: 'invoice_items#show'
      end
    end
  end
end
