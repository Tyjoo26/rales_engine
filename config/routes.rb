Rails.application.routes.draw do





  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      namespace :customers do
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
      end
      resources :customers, only: [:index, :show ]
    end
  end


end
