class AnswerMailer < ActionMailer::Base
  default from: "do-not-reply@gmail.com"

  def notify_question_owner(answer)
    @answer = answer
    @question = answer.question
    @receiver = @question.user
    mail(to: @receiver.email,
        subject: "You have a new answer on your question!")
  end
end
