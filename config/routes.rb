Rails.application.routes.draw do
  get 'welcome/index'

	resources :clients do
    resources :addresses
    resources :notes, shallow: true
    resources :dogs do
      resources :notes, shallow: true
    end
  end

  root 'welcome#index'
end
