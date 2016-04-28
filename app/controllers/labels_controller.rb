class LabelsController < ApplicationController
  def create
    @gist = Gist.find(params[:gist_id])
    @label = Label.new(label_params)
    @label.gist = @gist
    authorize @label
    if @gist.user == current_user
      if @label.save
        redirect_to gist_path(@gist)
      else
        render 'gists/show'
      end
    else
      redirect_to gist_path(@gist)
    end
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end
end
