Todo::Application.routes.draw do

  scope 'api' do
    resources :tasks do
      post :sort, :on => :collection
    end
    resources :categories
  end
  
  resource :incoming_mails, :only => [:create]
  
  root to: "tasks#index"
end
