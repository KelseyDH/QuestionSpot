require "spec_helper"

feature "Creating an answer for a question" do
  
  let(:user) { create(:user) }
  let(:question) { create(:question) }

  before do
    login_as(user, scope: :user)
  end

  it "creates an answer for the question", js: true do
    visit question_path(question)
    fill_in "answer_body", with: "Some valid answer"
    click_on "Submit an answer"
    expect(page).to have_text /Some valid answer/i
  end

end