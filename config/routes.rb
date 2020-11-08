Rails.application.routes.draw do
  root to: 'post_codes#index'

  resources :post_codes, only: %i[create index]
end
