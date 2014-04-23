require "spec_helper"

feature "creating a question" do

  let(:user) { create(:user) }

  before do
    login_as(user, :scope => :user)
      #scope is a devise command
  end
  
  it "Create an answer in the database" do
    visit questions_path
    click_on "Create New Question"
    fill_in "question title", with: "Some valid question title"
    fill_in "question description", with: "Some valid description"
    click_on "Save New Question"
    expect(current_path).to eq(questions_path)
    #save_and_open_page
      #will direct capabara to open a view of the page it sees
    expect(current_path).to eq(questions_path)
    expect(page).to have_text /Some valid question title/i
  end

  it "doesn't create a question with empty title" do
    visit new_question_path
    fill_in "question title", with: ""
    fill_in "question description", with: "Some valid description"
    click_on "Save New Question"
    # expect(page).to have_text /Some valid description/i
    expect(Question.count).to eq(0)

  end

end