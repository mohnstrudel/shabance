class RequestMailer < ApplicationMailer
  default from: 'Заявка на сайте <mohnstrudel@yandex.ru>'
  layout 'mailer'

  def notify_admin(request)
    @request = request

    mail to: Setting.first.email, subject: "Новая заявка на сайте shabanceable.ru"
  end

  def notify_client(request)
    @request = request
    @email = request.email
    
    mail to: @email, subject: "Ваша заявки принята"
  end

end
