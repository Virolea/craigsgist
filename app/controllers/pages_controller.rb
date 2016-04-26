class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  skip_after_action :verify_authorized, unless: :devise_controller?
  skip_after_action :verify_policy_scoped, unless: :devise_controller?

  def home
  end
end
