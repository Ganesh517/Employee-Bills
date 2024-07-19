Rails.application.routes.draw do
  resources :employees do
    resources :bills
  end

  resources :departments

  root 'employees#index'
end
