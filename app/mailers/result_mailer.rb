class ResultMailer < ActionMailer::Base
  default from: "deborah92ah@gmail.com"

  def create_result(user, result)
    @user = user
    @url  = "http://ranking-app.herokuapp.com/results/#{result.id}"
    mail(to: @user.email, subject: 'The result has been created')
  end

  def create_result_to_admin(user, result, admins)
    @user = user
    @url  = "http://ranking-app.herokuapp.com/results/#{result.id}"
    emails = admins.collect(&:email).join(",")
    mail(to: emails, subject: "A result has been created by #{@user.email}")
  end

  def edit_result_by_admin(user, result)
    @user = user
    @url  = "http://ranking-app.herokuapp.com/results/#{result.id}"
    mail(to: @user.email, subject: 'The response to the result sent')
  end

end
