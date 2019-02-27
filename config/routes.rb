Rails.application.routes.draw do
  resources :rating_questions
  root "rating_questions#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
