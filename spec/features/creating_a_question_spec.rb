require "spec_helper"

feature "creating a question" do

  let(:user) { create(:user) }

  before do
    login_as(user, :scope => :user)
      #scope is a devise command
  end
  
  it "Create an answer in the databse" do
    visit questions_path
    click_on "Create New Question"

  end

end