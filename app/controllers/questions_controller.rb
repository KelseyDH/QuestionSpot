class QuestionsController < ApplicationController

  def index
  end

  def new
  end 


  def create
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
