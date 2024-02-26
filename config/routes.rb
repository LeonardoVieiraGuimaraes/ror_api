Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

 # Define as rotas para o controlador TasksController dentro dos módulos Api e V1.
  # O método 'namespace' é usado para agrupar um conjunto de rotas sob um prefixo específico (neste caso, 'api' e 'v1').
  # Isso é comumente usado para versionar APIs.
  namespace :api do
    # Dentro do namespace 'api', temos outro namespace 'v1'.
    # Isso indica que essas rotas pertencem à versão 1 da nossa API.
    namespace :v1 do
      # O método 'resources' é uma função do Rails que cria várias rotas para um recurso específico com um único comando.
      # Neste caso, estamos criando rotas para o recurso 'tasks'.
      # Isso incluirá rotas para as operações CRUD (Create, Read, Update, Delete).
      # As rotas criadas serão similares a: /api/v1/tasks/:id, onde :id é o ID da tarefa.
      resources :tasks
    end
  end
end
