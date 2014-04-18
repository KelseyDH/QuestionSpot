class CommentsController < ApplicationController
 before_action :find_answer
 before_action :authenticate_user!

  def create
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.new(params.require(:comment).permit(:body))
    if @comment.save
      redirect_to @answer.question
    else
      flash.now[:alert] = "comments wasn't created!"
      render "questions/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!

    redirect_to @answer.question, notice: "Comment deleted successfully!"
    
    #Above is refactor of below, using find_answer private method
      #redirect_to @comment.answer.questions
  end

  private

  def find_answer
    @answer = Answer.find(params[:answer_id])
  end

  ### Earlier Create(s) used for testing:
  # def create
  #   @answer = Answer.find(params[:answer_id])
  #   @comment = @answer.comments.create(params.require(:comment).permit(:body))
  #   render nothing: true
  # end

    # def create
  #   @comment = Comment.create(params.require(:comment).permit(:body))
  #   render nothing: true
  # end

end
