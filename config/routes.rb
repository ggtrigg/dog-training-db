Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # get 'calendar/show'

  # resource :calendar, only: [:show], controller: :calendar
  # resources :events do
  #   resources :attendees, shallow: true
  # end
  resources :clients do
    resources :addresses
    resources :attendees, shallow: true
    resources :notes, shallow: true
    resources :dogs , shallow: true do
      resources :notes, shallow: true
      resource :intake_form
    end
    resources :events, only: [:new, :update]
  end

  authenticated :user do
    root to: 'clients#index', as: :authenticated_root
  end
  root to: redirect('users/sign_in')
  # root 'calendar#show'
end
