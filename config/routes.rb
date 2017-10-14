Rails.application.routes.draw do
  get 'welcome/index'

	resources :clients do
    resources :dogs
  end

  root 'welcome#index'
end
