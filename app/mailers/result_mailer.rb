class ResultMailer < ActionMailer::Base
  default from: "notifications@example.com"

  def create_result(user, result)
    @user = user
    @url  = result_path(result)
    mail(to: @user.email, subject: 'The result has been created')
  end

  def create_result_to_admin(user, result)
    @user = user
    @url  = edit_admin_result_path(result)
    mail(to: @user.email, subject: 'A result has been created by #{user}')
  end

  def edit_result_by_admin(user, result)
    @user = user
    @url  = result_path(result)
    mail(to: @user.email, subject: 'The response to the result sent')
  end

end
