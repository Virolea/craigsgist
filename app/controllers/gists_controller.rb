class GistsController < ApplicationController
  before_action :set_gist, only: [:show, :edit, :update, :destroy]

  def show
    @comment = Comment.new
    authorize @gist
  end

  def new
    @gist = Gist.new
    authorize @gist
  end

  def create
    @gist = Gist.new(gist_params)
    @gist.user = current_user
    authorize @gist
    if @gist.save
      redirect_to @gist
    else
      render :new
    end
  end

  def edit
    authorize @gist
  end

  def update
    authorize @gist
    if @gist.update(gist_params)
      flash[:notice] = "Gist updated !"
      redirect_to gist_path(@gist)
    else
      render :edit
    end
  end

  def destroy
    authorize @gist
    @gist.destroy
    redirect_to current_user
  end

  private

  def gist_params
    params.require(:gist).permit(:description, :title, :language, :code, :public)
  end

  def set_gist
    @gist = Gist.find(params[:id])
  end
end
