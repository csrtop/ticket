Rails.application.routes.draw do
  #resources :comentarios
  get 'finticket/index'

  resources :tareas do
    resources :comentarios
  end

  resources :prioridades
  resources :estados
  resources :tipos
  devise_for :users
  get 'inicio/index'
  root 'inicio#index'
  resources :empleados
  resources :departamentos
  resources :clubes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
