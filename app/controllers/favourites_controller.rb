class FavouritesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_question

  def create
    @question = Question.find(params[:question_id])
    @favourite = @question.favourites.new
    @favourite.user = current_user
    if @favourite.save
      redirect_to @question, notice: "Thank you for favouriting!"
    else
      redirect_to @question, alert: "Could not favourite again!"
    end
  
  end

  def destroy
    @favourite = current_user.favourites.find(params[:id])
    if @favourite.destroy
      redirect_to @question, alert: "You have unfavourited!"
    else
      redirect_to @question, alert: "Could not unfavourite!"
    end
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

end
