class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    #instantiate a question variable
    @question = Question.new
  end 


  def create
    # COMMENTED OUT
    # question_attributes = params.require(:question).permit([:title, :description])
    @question = Question.new(question_attributes)

    ### @question = Question.new(params[:question])
    ### forbidden in Rails 4+ for security reasons

    # same as below ^^
    # @question.title = params[:question][:title]
    # @question.title = params[:question][:description]
     if  @question.save
      flash[:notice] = "Your question was created successfully!"
      redirect_to questions_path
    else
      flash.now[:error] = "Please correct the form"
      render :new
    end

  end

  def show
    render text: "The id is #{params[:id]}"

  end


  def edit
    render text: "Editing #{params[:id]}"
  end

  def update
  end 

  def destroy
  end

  def vote_up
  end

  def vote_down
  end

  def search
  end

  private 
  def question_attributes
    question_attributes = params.require(:question).permit([:title, :description])
  end 

end
