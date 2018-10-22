Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :gig

  get 'pages/updatebulk', to: "gig#updatebulk", as: 'updatebulk'
  get 'pages/uploadfiles', to: "pages#uploadfiles", as: "uploadfiles"
  get 'tutoriel', to: "pages#tutoriel", as: "tutoriel"

  post 'upload', to: "pages#upload", as: :upload

  root to: 'pages#main', as: 'main'
  get 'retrieve', to: 'gig#retrieve_new_monthly_datas', as: 'retrieve'



end
