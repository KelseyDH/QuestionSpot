# spec/controllers/answers_controller_spec.rb
require 'spec_helper'

describe AnswersController do

  let(:user) { create(:user) }
  let(:question) { create(:question) }

  context "user signed in" do
    before {sign_in user}
    describe "#create" do

      def valid_request
        post :create, question_id: question.id,
                        answer: {body: "Valid body"}
      end

      it "adds an answer record to the database" do
        expect do
          valid_request
        end.to change { question.answers.count }.by(1)
      end

      it "sends an email to question owner" do
        ActionMailer::Base.deliveries.clear
        expect.(ActionMailer::Base.deliveries).to have(1).item
      end
    end
  end

end