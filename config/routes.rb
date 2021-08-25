Rails.application.routes.draw do

  devise_for :customers
root to: 'public/homes#top'
get 'about' => 'public/homes#about'


  namespace :admin do
    get 'orders/index'
  end
  devise_for :admins
  namespace :admin do
    resources :customers
  end
  namespace :admin do
    resources :genres
  end
  namespace :admin do
    resources :items
  end
  namespace :admin do
    get 'top' => 'homes#top'
  end
  namespace :admin do
    resources :orders
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

