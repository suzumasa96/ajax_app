Rails.application.routes.draw do
  root to: 'posts#index'
  #投稿完了ページ不要の為
  #get 'posts/new', to: 'posts#new'
  post 'posts', to: 'posts#create'
  get 'posts/:id', to 'posts#checked'
end
