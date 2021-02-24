class OrderMailer < ApplicationMailer
  def new_order_email
    @order = params[:order]

    mail(to: "hunterdenomme55@gmail.com", subject: "Your ticket has been submitted")
  end
end