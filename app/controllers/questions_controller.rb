class QuestionsController < ApplicationController

  before_action :find_question, 
                only: [:show, :edit, :destroy, :update,
                        :vote_up, :vote_down]
  
  # SAME AS ABOVE
  # before_action :find_question, except: [:index, :show, :edit, :destroy, :update]



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
    # @question = Question.find params[:id] -- All Below REPLACED BY before_as action

  end


  def edit
    # @question = Question.find params[:id]

    # render text: "Editing #{params[:id]}"
  end

  def update
    # @question = Question.find params[:id] -- REPLACED BY before_as action
    if @question.update_attributes(question_attributes)
    ##question_attributes protects from false updates
      redirect_to @question, notice: "Question updated successfully"
    else
      flash.now[:error] = "Unable to update"
      render :new
    end
  end 

  def destroy
    if  @question.destroy
    redirect_to questions_path, notice: "Question deleted successfully"
    else redirect_to questions_path, error: "We had trouble deleting your question"
    end
  end

  def vote_up
    @question.increment!(:vote_count) ##Increases vote count of question +1
    session[:has_voted] = true  ##Prevents multiple voting from user
    redirect_to @question
  end

  def vote_down
  end

  def search
  end


  private 

  def find_question
    @question = Question.find params[:id]
  end

  def question_attributes
    question_attributes = params.require(:question).permit([:title, :description])
  end 

end
