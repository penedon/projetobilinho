Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ies
  resources :alunos
  resources :matriculas do
    resources :faturas
  end
end
