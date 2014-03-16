BudgieBackend::Application.routes.draw do

  match "receipts/last", to: "receipts#lastReceipt", via: :get
  match "addItem", to: "receipts#addItem", via: :post
  match "removeItem", to: "receipts#removeItem", via: :post

  resources :receipts, only: [:show,:update] do
    match "finish", to: "receipts#processReceipt", via: :get
  end
  resources :items, only: [:index,:create]
  resources :tables, only: [:create,:show]
  resources :users, only: [:show] do
    resources :receipts, only: [:index, :create]
    match "addWish", to: "users#add_wish", via: :post
    match "removeWish", to: "users#remove_wish", via: :delete
    match "wishlist", to: "users#wishlist", via: :get
  end
end
