Rails.application.routes.draw do
  resources :annualreports

  root 'home#index'
  namespace :api, :defaults => {:format => :json} do
    resources :data_items
    resources :operation_types
    resources :industry_classifications
    resources :annual_reports do
      collection do
        get 'search', to: 'annual_reports#search'
      end
    end
  end
end
