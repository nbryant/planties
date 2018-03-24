Rails.application.routes.draw do
  scope :constraints => {:format => :json}, :defaults => {:format => :json} do
    resources :events, only: [:index, :show, :create]
    resources :plants
  end
end
