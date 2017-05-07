Rails.application.routes.draw do
  resources :hourly_forecasts
  get '/hourly_forecast/current', to: 'hourly_forecasts#current'
end
