require "spec_helper"

describe "questions/new.html.haml" do
  before do
    assign(:question, stub_model(Question))
      #simulates an instance variable @question
    render
      #renders the view we created

  end

  it "contains text 'Create New Question'" do
    expect(rendered).to match /Create New Question/i
  end

  it "renders '_form' template" do
    expect(rendered).to render_template(partial: "_form")
  end

  # it "contains an h1 element" do
  #   expect(rendered).to have_selector("h1")
  # end


end