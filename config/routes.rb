Rails.application.routes.draw do
  get 'calendar/show'

  resource :calendar, only: [:show], controller: :calendar
  resources :events
	resources :clients do
    resources :addresses
    resources :notes, shallow: true
    resources :dogs do
      resources :notes, shallow: true
    end
  end

  root 'calendar#show'
end
