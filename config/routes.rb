Rails.application.routes.draw do
  root 'slots#index'
  resources 'books', :only => [:show]
  get 'cassandra' => 'cassandra#index'
end
