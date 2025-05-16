Rails.application.routes.draw do
  resources :todos
  resources :categories

  # Filter todos by category
  get 'categories/:id/todos', to: 'todos#index', as: 'category_todos'

  # Optional: Set root to todos#index
  root "todos#index"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
