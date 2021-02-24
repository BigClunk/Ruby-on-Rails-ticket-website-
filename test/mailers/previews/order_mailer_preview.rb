# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def new_order_email
    # Set up a temporary order for the preview
    order = Order.new(first_name: "Joe", last_name: "Smith", email: "joe@gmail.com", problem: "1-2-3 Chuo, Tokyo, 333-0000", phone: "090-7777-8888")

    OrderMailer.with(order: order).new_order_email
  end
end