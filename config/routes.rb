Rails.application.routes.draw do

  
  namespace :public do
    get 'order_details/new'
  end
root to: 'public/homes#top'
get 'about' => 'public/homes#about'
get 'items' => 'public/items#index'
get 'items/:id' => 'public/items#show', as: 'item'
post 'cart_items' => 'public/cart_items#create'
get 'cart_items' => 'public/cart_items#index'
patch 'cart_items' => 'public/cart_items#update'

delete 'cart_items/:id' => 'public/cart_items#destroy', as: 'destroy_cart_item'
delete 'cart_items' => 'public/cart_items#destroy_all', as: 'cart_items_destroy_all'


get 'orders/new' => 'public/orders#new'
post 'orders/comfirm' => 'public/orders#comfirm'
post 'orders' => 'public/orders#create'
get 'orders/complete' => 'public/orders#complete'
get 'orders' => 'public/orders#index', as: 'orders_index'
get 'orders/:id' => 'public/orders#show', as: 'order'

  scope module: 'public' do
    get 'customers/edit/:id' => 'customers#edit', as: 'edit_customer'
    patch 'customers' => 'customers#update', as: 'customer'
    get 'customers/my_page' => 'customers#show'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw'
   end
  get 'addresses' => 'public/addresses#index'
  get 'addresses/:id/edit' => 'public/addresses#edit'
  post 'addresses' => 'public/addresses#create'
  patch 'addresses/:id' => 'public/addresses#update'
  delete 'addresses/:id' => 'public/addresses#destroy'

  namespace :admin do
    get 'orders/index'
  end
#  devise_for :admins
    devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
    }
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
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
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

