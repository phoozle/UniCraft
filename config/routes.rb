UniCraftV2::Application.routes.draw do
  # Pages
  get "pages/home"
  get "/home" => "pages#home"

  # API
  namespace :api do
    resources :minecraft_players, :only => [:create, :show]
  end

  # Activation
  get "/verify/:verification_code" => "minecraft_players#verify", :constraints => {:verification_code => /\w{32}/}, :as => :verify

  root :to => 'pages#home'
end
