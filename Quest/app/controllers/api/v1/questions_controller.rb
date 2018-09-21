class Api::V1::QuestionsController < ApplicationController
  def current_user
  end
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :verify_authentication


  def verify_authentication
    user = authenticate_with_http_token do |token, options|
      User.find_by_api_token(token)
    end

    unless user
      render json: { error: "You don't have permission to access these resources" }, status: :unauthorized
    end
  end

    before_action :set_question, only: [:show]
  
    def index
      @questions = Question.page(params[:page])
    end
  
    def show
      @answers = @question.answers
      @answer = Answer.new(params[:question_id])
      render json: @answer
    end
  
    def edit
      @question = Question.find(params[:id])
    end
  
    def create
      @question = Question.new(question_params)
  
      if @question.save
        render json: @question, status: :created, location: @question
      else
        render json: @question.errors, status: :unprocessable_entity
      end
    end
  
  
    private
  
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :body, :username, :user_id)
    end

end
