Rails.application.routes.draw do
  get 'calendar/show'

  resource :calendar, only: [:show], controller: :calendar
  resources :events do
    resources :attendees, shallow: true
  end
	resources :clients do
    resources :addresses
    resources :attendees, shallow: true
    resources :notes, shallow: true
    resources :dogs , shallow: true do
      resources :notes, shallow: true
    end
    resources :events, only: [:new, :update]
  end

  root 'calendar#show'
end
