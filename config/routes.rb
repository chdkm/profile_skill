Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users do
    resources :user_skills, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :skill_categories
end
