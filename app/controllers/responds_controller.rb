class RespondsController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit]

  def create
    @crespond = @message.comments.build(params.require(:respond).permit(:body))
    @respond.user = current_user

    if @respond.save
      flash[:notice] = "Your comment was added"
      redirect_to message_path(@message)
    else
      render 'messages/show'
    end
  end
end