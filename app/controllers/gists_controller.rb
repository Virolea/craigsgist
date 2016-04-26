class GistsController < ApplicationController
  before_action :set_gist, only: :show
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

  def show
    authorize @gist
  end

  private

  def gist_params
    params.require(:gist).permit(:description, :title, :code, :public)
  end

  def set_gist
    @gist = Gist.find(params[:id])
  end
end
