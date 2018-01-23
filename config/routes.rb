Rails.application.routes.draw do





  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '', to: "merchants#index"
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/:id', to: "merchants#show"
      end
      namespace :customers do
        get '', to: "customers#index"
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/:id', to: "customers#show"
      end
      namespace :transactions do
        get '', to: "transactions#index"
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/:id', to: "transactions#show"
      end
    end
  end


end
