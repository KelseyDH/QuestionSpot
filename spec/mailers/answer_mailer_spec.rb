
require 'spec_helper'

describe AnswerMailer do

  let(:user) { create(:user)}
  let(:user1) { create(:user) }
  let(:question) { create(:question, user: user)}
  let(:answer) { create(:answer, question: question, user: user1)}


  describe "#notify_question_owner" do

    #####instance variable shortcut for repeated methods
    subject { AnswerMailer.notify_question_owner(answer) }

    #Same as:

    # before do
    #   @mail = AnswerMailer.notify_question_owner(answer)
    # end
    ###############
    its(:to) { should eq([user.email]) }
    
    #failing:
    its(:from) { should eq(["do-not-reply@gmail.com"]) }
    its("body.encoded.to_s") { should match(/#{answer.body}/i) }

    #Same as:

    # it "sends email to question owner" do
    #   expect(@mail.to).to eq([user.email])
    # end

    # it "sends email from noreply@awesomeanswers.com" do
    #   expect(@mail.to).to eq([user.email])
    # end

    # it "contains the answer body in the email body" do
    #   expect(@mail.body.to_s).to match /#{answer.body}/i
    # end
    ################

  end


end