Rails.application.routes.draw do
  resources :users
  resources :campaigns
  resources :video_styles

  get "/dashboard", to: "dashboards#index"
  get "/dashboard/video_styles", to: "dashboards#show"
  get "dashboard/video_styles/:id", to: "dashboards#video_style"
  # resources :dashboards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
