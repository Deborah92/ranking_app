class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.nil? # user is not logged in
      session[:next] = request.fullpath
      redirect_to new_user_session_path,
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

  private

  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = 'You must be an admin to do that'
      redirect_to root_path
    end
  end

  def devise_error_messages!
    html = ""

    return html if resource.errors.empty?

    errors_number = 0

    html << "<ul class=\"#{resource_name}_errors_list\">"

    saved_key = ""
    resource.errors.each do |key, value|
      if key != saved_key
        html << "<li class=\"#{key} error\"> This #{key} #{value} </li>"
        errors_number += 1
      end
      saved_key = key
    end

    unsolved_errors = pluralize(errors_number, "unsolved error")
    html = "<h2 class=\"#{resource_name}_errors_title\"> You have #{unsolved_errors} </h2>" + html
    html << "</ul>"

    return html.html_safe
  end

end
