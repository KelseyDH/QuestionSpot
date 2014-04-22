require "spec_helper"

feature "Visiting Home Page" do
  
  it "contains a text 'Listing All Questions'" do
    visit root_path
      #visit is a capybara gem command to do a user action
    expect(page).to have_text /Listing all questions/i
  end

end