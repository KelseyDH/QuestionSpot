class AnswersController < ApplicationController
##Class Answers Controller was generated separately after Answer Model was generated

before_action :find_question

def create
 
  @answer  = @question.answers.new(answer_attributes)
  @answer.user = current_user
  #Above ^^^ replaces below due to creation of User accounts
  # @question = Question.find params[:question_id]
  # @answer = Answer.new(answer_attributes)
  #answer_attributes is a private method taking care of NEW parameters
  
  if @answer.save
    # AnswerMailer.notify_question_owner(@answer).deliver
    AnswerMailer.delay.notify_question_owner(@answer) #Note: Uses a Delay gem
    redirect_to @question, notice: "Answer Submitted Successfully"
  else
    render "/questions/show"
  end
end


def destroy
  #find_question replaced need for:  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])

  ##Checks eligibility of current user
  if @answer.user == current_user && @answer.destroy
    redirect_to @question, notice: "Answer Deleted"
  else
    redirect_to @question, alert: "We had trouble deleting the answer"
  end 
end

private

  ##private method to use for Answer.new
def answer_attributes
    params.require(:answer).permit([:body])
  end
 
# find_question was not needed in Answers Controller when Questions Controller.find_question added params[:question_id]
# UPDATE: Now adding find_question back now due to scoping for user permissions
def find_question
    @question = Question.find params[:question_id]
  end

end
