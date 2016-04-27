class CommentsController < ApplicationController
  def create
    @gist = Gist.find(params[:gist_id])
    @comment = Comment.new(comment_params)
    @comment.gist = @gist
    @comment.user = current_user
    authorize @comment
    if @comment.save
      respond_to do |format|
        format.html { redirect_to gist_path(@gist) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'gists/show' }
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
