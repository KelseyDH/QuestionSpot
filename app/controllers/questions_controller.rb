class QuestionsController < ApplicationController

  def index
  end

  def new
    #instantiate a question variable
    @question = Question.new
  end 


  def create
    @question.save
  end

  def show
    render text: "the id is #{params[:id]}"

  end


  def edit
    render text: "Editing #{params[:id]}"
  end

  def update
  end 

  def destroy
  end

  def vote_up
  end

  def vote_down
  end

  def search
  end

end
