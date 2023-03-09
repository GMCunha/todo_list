Rails.application.routes.draw do
  resources :items
  resources :lists
  resources :home do
    collection do
      delete 'clear_lists'
      delete 'clear_items'
    end
  end
  
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
