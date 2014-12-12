class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Message was created"
      redirect_to messages_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @message.update(message_params)
      redirect_to messages_path
    else
      render :edit
    end
  end

  def destroy
    if @message.destroy
      redirect_to messages_path
    else
      render message_path
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :content)
  end
end