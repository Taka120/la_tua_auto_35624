Rails.application.routes.draw do
  get 'notifications/index'
  root to: "notifications#index"
end
