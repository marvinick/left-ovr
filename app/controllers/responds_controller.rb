class RespondsController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit, :vote]

  def create
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Your comment was added"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end
end