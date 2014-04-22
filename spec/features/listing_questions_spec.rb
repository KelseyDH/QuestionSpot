require "spec_helper"

feature "Listing Questions Page" do
  
  it "should list question in the database" do
    question = create(:question)
    visit questions_path
    save_and_open_page
      #^opens the relevant page when Rspec is run

    expect(page).to have_text /#{question.title}/i
  end

end