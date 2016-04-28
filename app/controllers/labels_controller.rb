class LabelsController < ApplicationController
  def create
    @gist = Gist.find(params[:gist_id])
    @label = Label.new(label_params)
    @label.gist = @gist
    authorize @label
    if @gist.user == current_user
      if @label.save
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
    else
      redirect_to gist_path(@gist)
    end
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end
end
