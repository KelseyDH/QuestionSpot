require "spec_helper"

describe Answer do
  
  it "should capitalize body before saving" do
    body = "uncapitalized valid body"
    answer = Answer.new(body: body)
    answer.save
    expect(answer.body).to eq("Uncapitalized valid body")
  end


end