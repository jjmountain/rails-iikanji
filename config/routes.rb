Rails.application.routes.draw do
  devise_for :users
  root to: 'kanji#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "kanji_cards", to: "kanji_cards#index"

  get "kanji_cards/:id", to: "kanji_cards#show"

  get "kanji_cards/:id/edit", to: "kanji_cards#edit"
  patch "kanji_cards/:id", to: "kanji_cards#update"

  delete "kanji_cards/:id", to: "kanji_cards#destroy"

  resources :kanji, only: [:index, :show]

end
