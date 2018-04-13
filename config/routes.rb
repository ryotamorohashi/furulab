Rails.application.routes.draw do
  # top_page path
  root to: 'pages#top'
  # index show create new update edit delete path
  resources :students
end
