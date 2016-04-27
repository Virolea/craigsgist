class CommentsController < ApplicationController
  def create
    @gist = Gist.find(params[:gist_id])
    @comment = Comment.new(comment_params)
    @comment.gist = @gist
    @comment.user = current_user
    authorize @comment
    if @comment.save
      redirect_to gist_path(@gist)
    else
      render 'gists/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
