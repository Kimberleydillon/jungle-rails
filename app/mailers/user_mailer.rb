class UserMailer < ApplicationMailer
   default from: 'no-reply@jungle.com'

  def welcome_email(order)

    @order = order
    @url = '/login'
    mail(to: @order.email, subject: 'Welcome to the Jungle!')
  end
end
