Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, path: '', path_names: { sign_in: 'login' }, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do
    get 'sign_out', to: 'users/sessions#destroy'
  end

  resources :citizens, except: :show
  root to: 'citizens#index'

  namespace :api do
    namespace :v1 do
      get 'inss_calculator', controller: :inss_calculators, action: :calculate
      resources :states, only: [] do
        resources :cities, only: :index
      end
    end
  end
end
