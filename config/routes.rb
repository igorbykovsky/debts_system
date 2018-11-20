Rails.application.routes.draw do

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    root 'debtors#index'

    resources :debtors do
      get 'current', on: :collection
      resources :debts do
        get 'destroy_all', on: :collection
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
