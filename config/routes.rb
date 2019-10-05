Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  apipie

  require 'resque/server'
  mount Resque::Server, at: '/jobs'

  scope 'auth', module: 'api/v1' do
    resources :promotions
    resources :cars
    resources :car_models
    resources :feedbacks
    resources :faqs
    resources :car_services
    resources :spare_parts
    resources :insurance_companies
    resources :maintenances
    resources :car_check_appointments
    resources :branches
    resources :car_reservations do
      member do
        match 'mazda_update_reservations', to: 'car_reservations#update_from_mazda', via: [:put, :patch]
      end
    end
    resources :car_insurances, only: [:index, :show]
    resources :car_model_details
    resources :bank_accounts
    resources :payments
    match '/charge', to: 'payments#create', via: :post
    match '/users', to: 'users#index', via: :get
    match '/users/:id/sign_out', to: 'users#expire_token', via: [:put, :patch]
    match '/users/:id/setting', to: 'users#setting', via: :get
    match '/users/:id', to: 'users#update', via: :patch
    match '/register', to: 'registration#create', via: :post
    match '/set-password', to: 'registration#set_password', via: :post
    match '/reset-password', to: 'registration#reset_password', via: :post
    match '/users/:id/add_phone', to: 'users#add_phone', via: :post
    match '/users/:id/verify_phone', to: 'users#verify_phone', via: :post
    match '/users/:id/verify_otp', to: 'users#verify_otp', via: :post
    match '/users/:id', to: 'users#show', via: :get
    match '/users/:id', to: 'users#destroy', via: :delete

    post '/backends/:model_name', to: 'backends#create'
    get '/backends/:model_name/:id', to: 'backends#show'
    delete '/backends/:model_name/:id', to: 'backends#destroy'
    match '/backends/:model_name/:id', to: 'backends#update', via: [:patch, :put]

    resources :users, only: [] do
      resources :user_cars
    end
  end

  scope 'auth' do
    match '/forgot-password', to: 'api_guardian/registration#reset_password', via: :post
  end

  mount ApiGuardian::Engine => '/auth', as: :api
end
