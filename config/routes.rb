Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '', to: "merchants#index"
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
        get '/most_revenue', to: "most_revenue#index"
        get '/most_items', to: "most_items#index"
        get '/revenue', to: "total_revenue#index"
        get '/:id', to: "merchants#show"
        get '/:id/favorite_customer', to: "favorite_customer#show"
        get '/:id/revenue', to: "total_revenue#show"
        get '/:id/customers_with_pending_invoices', to: "pending_customers#show"
        get '/:id/items', to: "merchant_items#index"
        get '/:id/invoices', to: "merchant_invoices#index"

      end
      namespace :customers do
        get '', to: "customers#index"
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
        get '/:id', to: "customers#show"
        get '/:id/invoices', to: "customer_invoices#index"
        get '/:id/transactions', to: "customer_transactions#index"
        get '/:id/favorite_merchant', to: "favorite_merchant#show"

      end
      namespace :transactions do
        get '', to: "transactions#index"
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
        get '/:id', to: "transactions#show"
        get '/:id/invoice', to: "transaction_invoice#show"
      end
      namespace :invoices do
        get '', to: 'invoices#index'
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: "random#show"
        get '/:id', to: 'invoices#show'
        get '/:id/transactions', to: "invoice_transactions#show"
        get '/:id/invoice_items', to: "invoice_invoice_items#show"
        get '/:id/items', to: "invoice_items#show"
        get '/:id/customer', to: "invoice_customer#show"
      end
      namespace :items do
        get '', to: 'items#index'
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: "random#show"
        get '/most_revenue', to: "most_revenue#index"
        get '/most_items', to: "most_items#index"
        get '/:id', to: 'items#show'
        get "/:id/best_day", to: "best_day#show"
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
