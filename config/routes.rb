Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'home#index'
get   'home/index', link_to:'home#new'
post  'home/index', link_to:'home#create'
post  '/', to:'home#create'


end
