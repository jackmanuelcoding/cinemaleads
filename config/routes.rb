Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up", to: "rails/health#show", as: "rails_health_check"

  root "home#show"

  devise_for :users,
             path: "",
             path_names: {
               sign_up: "register",
               confirmation: "confirm-account",
               sign_in: "login",
               password: "forgot-password",
               edit: "settings"
             }

  resources :stripe_webhooks, only: [:create]
  resources :leads

  resource :console, only: [:show]

  get "checkout", to: "checkouts#new", as: "checkout"
  post "create-checkout-session",
       to: "checkouts#create",
       as: "create_checkout_session"
  get "search", to: "searches#index", as: "search"
end
