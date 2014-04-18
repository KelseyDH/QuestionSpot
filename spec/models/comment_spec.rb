require 'spec_helper'
#To run a test of all, in console ~>rspec spec

describe Comment do

  #can use this for conducting tests from controller:
  #describe CommentsController
  #get :index

  it "doesn't allow creating comment without a body" do
    comment = Comment.new
    comment.save
    expect(comment).to_not be_valid
  end
  

  ##Same as above
  # it "doesn't allow creating comment without a body" do
  #   comment = Comment.new
  #   comment.save
  #   expect.errors.messages.should have_key(:body)
  # end


  #test for body comment having 3 text characters or more
  #To call specific test in console ~> rspec spec/models/comment_spec.rb:21
  it "doesn't allow a comment body shorter than 3 characters" do
    comment = Comment.new(body: "ab")
    expect(comment).to_not be_valid
  end

  #test for Commment model, sanitize squeeze of whitespace text
  describe ".sanitize" do

    it "removes repeated white spaces in the body" do
      text = "body   with   duplicate spaces"
      comment = Comment.new(body: text)
      comment.sanitize
      expect(comment.body).to eq("body with duplicate spaces")
    end

    #test for Comment model, body text stripping on edges of text
    it "strips spaces at the edges of the body text" do
      text = " body with spaces around "
      comment = Comment.new(body: text)
      comment.sanitize
      expect(comment.body).to eq("body with spaces around")
    end
  end

  describe "Recent Ten Comments Scope" do
    before do
      11.times{|x| Comment.create!(body: "valid body #{x}")}
    end

    it "returns 10 records" do
      expect(Comment.recent_ten.count).to eq(10)
    end

    it "returns most recent" do
      expect(Comment.recent_ten).to_not include(Comment.first)
    end
  end

  describe "capitalize" do

    it "returns capitalized answers" do
      text = "uncapitalized"
      comment = Comment.new(body: text)
      # comment.capitalize
      comment.save
      expect(comment.body).to eq("Uncapitalized")
    end
  end


end
