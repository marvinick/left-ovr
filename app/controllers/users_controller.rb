class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :destroy]
  before_action :require_user, except: [:index, :show]

def index
  @users = User.all
end

def new
  @user = User.new
end

def create
  @user = User.new(user_params)

  if @user.save
    redirect_to users_path
  else
    render :new
  end
end

def edit; end

def update
  if @user.update(user_params)
    redirect_to users_path
  else
    render :edit
  end
end

def show; end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :about)
  end
end