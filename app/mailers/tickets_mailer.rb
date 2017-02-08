class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: t('.subject'))
  end

  def cancellation_buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: t('.subject'))
  end
end
