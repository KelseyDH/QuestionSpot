class CommentsController < ApplicationController

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
    @comment.destroy
    render nothing: true
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
