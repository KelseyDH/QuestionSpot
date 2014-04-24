class TodosController < ApplicationController

  def index
    #render nothing: true
    #with phonegap you render json:
    render json: Todo.select(:title, :id)
  end

  def create
    @todo = Todo.new(params.require(:todo).permit(:title))
    if @todo.save
      render json: {success: true, title: @todo.title}
    else
      render json: {success: false, errors: @todos.errors.full_messages }
    end
  end

end
