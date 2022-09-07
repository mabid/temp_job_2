Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "offices#index"
  resources :offices do
    member do
      get :temp_jobs
      get :booking_requests
      get :booking_proposals
      post :post_temp_job
    end
  end
  resources :professionals do
    member do
      get :applications
      get :temp_job_posts
      get :invites
      get :proposals
      post :apply
    end
  end
  resources :proposals, :invites, :applications, :booking_requests, :temp_job_posts, :booking_proposals, :temp_jobs
end
