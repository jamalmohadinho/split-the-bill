Rails.application.routes.draw do
  root "trips#index"

  # users (signup)
  get    "users",          to: "users#index"
  get    "users/new",      to: "users#new"
  get    "users/:id",      to: "users#show", as: "user"
  post   "users",          to: "users#create"
  get    "users/:id/edit", to: "users#edit", as: "edit_user"
  patch  "users/:id",      to: "users#update"
  put    "users/:id",      to: "users#update"
  delete "users/:id",      to: "users#destroy"

  # sessions (login/logout)
  get    "login",          to: "sessions#new", as: "login"
  post   "login",          to: "sessions#create"
  get "logout",         to: "sessions#destroy", as: "logout"
  get    "signup",         to: "users#new", as: "signup"

  # trips
  get    "trips",          to: "trips#index"
  get    "trips/new",      to: "trips#new", as: "new_trip"
  get    "trips/:id",      to: "trips#show", as: "trip"
  post   "trips",          to: "trips#create"
  get    "trips/:id/edit", to: "trips#edit", as: "edit_trip"
  patch  "trips/:id",      to: "trips#update"
  put    "trips/:id",      to: "trips#update"
  delete "trips/:id",      to: "trips#destroy"

  # expenses (nested under trips)
  get    "trips/:trip_id/expenses/new",  to: "expenses#new",     as: "new_trip_expense"
  post   "trips/:trip_id/expenses",      to: "expenses#create",  as: "trip_expenses"
  delete "trips/:trip_id/expenses/:id",  to: "expenses#destroy", as: "trip_expense"
end