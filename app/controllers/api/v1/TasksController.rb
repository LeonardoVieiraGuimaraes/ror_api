# Define uma nova classe de controlador dentro dos módulos Api e V1.
class Api::V1::TasksController < ApplicationController

  # A ação index é usada para recuperar todas as tarefas.
  def index
    # Recupera todas as tarefas do banco de dados.
    tasks = Task.all

    # Renderiza as tarefas como JSON.
    render json: tasks
  end

  # A ação create é usada para criar uma nova tarefa.
  def create
    # Cria uma nova tarefa com os parâmetros permitidos.
    task = Task.new(task_params)

    # Tenta salvar a tarefa no banco de dados.
    if task.save
      # Se a tarefa for salva com sucesso, renderiza a tarefa como JSON com um status HTTP de 201 (Criado).
      render json: task, status: :created
    else
      # Se a tarefa não puder ser salva, renderiza os erros como JSON com um status HTTP de 422 (Entidade Não Processável).
      render json: task.errors, status: :unprocessable_entity
    end
  end

  # A ação show é usada para recuperar uma tarefa específica pelo ID.
  def show
    # Recupera a tarefa pelo ID.
    task = Task.find(params[:id])

    # Renderiza a tarefa como JSON.
    render json: task
  end

  # A ação update é usada para atualizar uma tarefa específica pelo ID.
  def update
    # Recupera a tarefa pelo ID.
    task = Task.find(params[:id])

    # Tenta atualizar a tarefa com os parâmetros permitidos.
    if task.update(task_params)
      # Se a tarefa for atualizada com sucesso, renderiza a tarefa como JSON.
      render json: task
    else
      # Se a tarefa não puder ser atualizada, renderiza os erros como JSON com um status HTTP de 422 (Entidade Não Processável).
      render json: task.errors, status: :unprocessable_entity
    end
  end

  # A ação destroy é usada para excluir uma tarefa específica pelo ID.
  def destroy
    # Recupera a tarefa pelo ID.
    task = Task.find(params[:id])

    # Exclui a tarefa.
    task.destroy

    # Retorna um status HTTP de 204 (Sem Conteúdo), indicando que a tarefa foi excluída com sucesso.
    head :no_content
  end

  private

  # Define um método privado para os parâmetros da tarefa.
  def task_params
    # Exige que os parâmetros incluam uma chave :task e permite apenas os parâmetros :title, :description e :completed.
    # Isso é conhecido como "strong parameters" e é uma prática de segurança importante em aplicações Rails.
    params.require(:task).permit(:title, :description, :completed)
  end

end
