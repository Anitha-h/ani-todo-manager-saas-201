class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # @todos = Todo.where(user_id: current_user.id)
    @todos = Todo.of_user(current_user)
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.where(user_id: current_user.id).find(id)
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
      user_id: current_user.id,
    )
    redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.where(user_id: current_user.id).find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.where(user_id: current_user.id).find(id)
    todo.destroy
    redirect_to todos_path
  end
end
