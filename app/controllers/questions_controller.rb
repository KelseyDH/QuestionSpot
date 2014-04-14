class QuestionsController < ApplicationController

 #added when users added to confirm session first
 before_action :authenticate_user!, except: [:index, :show]

  before_action :find_question, 
                only: [:edit, :destroy, :update,
                        :vote_up, :vote_down]  
                        #note that :show was removed from before_action due to change in find_question

  
  # SAME AS ABOVE
  # before_action :find_question, except: [:index, :show, :edit, :destroy, :update]



  def index
    @questions = Question.all
  end

  def new
    #instantiate a question variable
    @question = Question.new
  end 

  def show
    @question = Question.find(params[:question_id] || params[:id])
    @answer = Answer.new
    #NOTE HIGH number of instance variables above(convention is 2 per method)
    #this means we should refactor soon
    @answers = @question.answers.ordered_by_creation
    #Note that @answers is being used by show.html.haml to render data, which is then used to identify
    #partial page _answer.html.haml
    #NEEDS FIXING: @vote = current_user.vote_for(@question) || Vote.new
    @favourite = current_user.favourite_for(@question)
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


  def create
    # COMMENTED OUT
    # question_attributes = params.require(:question).permit([:title, :description])
    @question = Question.new(question_attributes)

    ### @question = Question.new(params[:question])
    ### ^^forbidden in Rails 4+ for security reasons

      # same as below ^^
      # @question.title = params[:question][:title]
      # @question.title = params[:question][:description]

    ####for a user creating a question
    @question.user = current_user
    #Above replaces (do not use):
    #@question.user = current_user.questions.new(question_attributes)
    ####
     if  @question.save
      flash[:notice] = "Your question was created successfully!"
      redirect_to questions_path
    else
      flash.now[:error] = "Please correct the form"
      render :new
    end

  end

  def edit
    # @question = Question.find params[:id]

    # render text: "Editing #{params[:id]}"
  end


  # def vote_up
  #   @question.increment!(:vote_count) ##Increases vote count of question +1
  #   session[:has_voted] = true  ##Prevents multiple voting from user
  #   redirect_to @question
  # end

  # def vote_down
  # end

  def search
  end


  private 

  def find_question
    # @question = current_user.questions.find(params[:question_id] || params[:id])
    @question = current_user.questions.find_by_id(params[:id])
    redirect_to root_path, alert: "Access Denied" unless @question

    #This replaced by ^^ @question = Question.find(params[:question_id] || params[:id])
    ####This replaced by ^^ above:@question = Question.find params[:id]  Replaced with above^^

  end

  ##Method to define what's needed to create a new question
  def question_attributes
    question_attributes = params.require(:question).permit([:title, :description, {:category_ids => []}])
  end 

end
