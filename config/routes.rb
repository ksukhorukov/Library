require 'sidekiq/web'

Rails.application.routes.draw do
  root 'slots#index'
  resources 'books', :only => [:show]
  get 'cassandra' => 'cassandra#index'
  mount Sidekiq::Web, at: '/sidekiq'
end
