class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.nil? # user is not logged in
      session[:next] = request.fullpath
      redirect_to login_url,
                  :alert => "Please log in to continue."
    else
      if request.env["HTTP_REFERER"].present?
        redirect_to :back, :alert => exception.message
      else
        render :file => "#{Rails.root}/public/403.html",
               :status => 403, :layout => false
      end
    end
  end

end
