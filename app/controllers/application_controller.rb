class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_editor!
    redirect_to root_path unless user_signed_in? && current_user.is_editor?
  end
  def authenticate_admin!
    redirect_to root_path unless user_signed_in? && current_user.is_admin?
  end



end

