UniCraftV2::Application.routes.draw do

  get "pages/home"

  match "/home" => "pages#home"

  root :to => 'pages#home'
end
