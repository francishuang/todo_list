class TodosController < ApplicationController

  before_action :find_todo, only: [:show, :edit, :update, :destroy, :done]

  def index
    @todos = Todo.order(due_date: :asc)  
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = 'Success'
      redirect_to todos_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @todo.update_attributes(todo_params)
      redirect_to todo_path(@todo)
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy

    redirect_to todos_path
  end

  def done
    @todo.update(done: !(@todo.done))
  end

  private

  def find_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :due_date, :note, :done)
  end

end
