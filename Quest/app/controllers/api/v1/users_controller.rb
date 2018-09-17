class UsersController < ApplicationController
  skip_before_action :verify_authentication
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    @user = User.find(params[:id])

      if @user.update(user_params)
        render @user, status: :created, location: @user 
      else
        render json: @user.errors, status: :unprocessable_entity 
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      render json: head :no_content 
    end
  end

  def verify_authentication
    user = authenticate_with_http_token do |token, options|
      User.find_by_api_token(token)
    end

    unless user
      render json: error: "You don't have permission to access these resources", status: :unauthorized
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    
end
