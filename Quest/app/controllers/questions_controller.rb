class QuestionsController < ApplicationController
  before_action :set_question, only: [:show]

  def index
    @questions = Question.page(params[:page])
  end

  def show
    @answers = @question.answers
    @answer = Answer.find(params[:id])
  end

  def new
    redirect_to new_session_path, notice: 'You must be logged in to add a question' if !current_user
    @question = Question.new
  end

  def edit
    redirect_to new_session_path, notice: 'You must be logged in to edit a question' if !current_user
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)

    if @question.save
        redirect_to question_path(@question)
    else
        render 'new'
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params) 
      redirect_to question_path
    else
      render 'edit'
    end
  end


  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body, :username)
  end

end