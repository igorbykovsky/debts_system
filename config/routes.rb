Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :debtors do
    get 'current', on: :collection
    resources :debts do
      get 'destroy_all', on: :collection
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
