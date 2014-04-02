class AnswersController < ApplicationController
##Generated separately after Answer Model was generated
def create
  @question = Question.find params[:question_id]
  @answer = @question.answers.new(answer_attributes)
  #answer_attributes is a private method taking care of NEW parameters

  if @answer.save
    redirect_to @question, notice: "Answer Submitted Successfully"
  else
    render "/questions/show"
  end
end


private

##private method to use for Answer.new
def answer_attributes
  params.require(:answer).permit([:body])
end

end
