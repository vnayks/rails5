class TodosController < ApplicationController
  before_action :todo, only: %i[destroy edit update show]
  
  def new
    @todo = Todo.new
  end

  def index
    @todos = Todo.all.sort
  end

  def create
    @todo = Todo.new(allowed_params)
    if @todo.save
      flash[:notice] = "Successfully crated todo!!"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    if @todo.update(allowed_params)
      flash[:notice] = "Todo was successfully updated!"
      redirect_to show
    else
      render 'edit'
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      flash[:notice] = "successfully deleted!"
    else
      render 'index'
    end
  end

  private

  # @return [todo]
  def todo
    @todo = Todo.find(params[:id])
  end

  def allowed_params
    params.require(:todo).permit(:name, :description)
  end
end
