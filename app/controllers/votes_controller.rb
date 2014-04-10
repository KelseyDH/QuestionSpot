class VotesController < ApplicationController
before_action :authenticate_user!
#links voting action to user account


  def create
    @question = Question.find(params[:question_id])
    @vote = @question.votes.new(vote_params)
    @vote_user = current_user
    if @vote.save
      redirect_to @question, notice: "Thank you for voting!"
    else
      redirect_to @question, alert: "Your vote wasn't recorded!"
    end
  end

  def update
    @vote = current_user.votes.find(params[:id])
    if @vote.update_attributes(vote_params)
      redirect_to @question, notice: "Vote Updated!"
    else
      redirect_to @question, notice: "Vote wasn't updated!"
    end
  end

  def destroy
    @vote = current_user.votes.find(params[:id])
    if @votes.destroy
      redirect_to @question, notive: "Vote removed!"
    else
      redirect_to @question, alert: "Vote could not be removed!"
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:is_up)
  end

  def find_question
   @question = Question.find(params[:question_id])
  end

end
