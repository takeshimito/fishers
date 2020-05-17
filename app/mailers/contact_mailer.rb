class ContactMailer < ApplicationMailer
  
  def contact_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'fising.navi.123@gmail.com',
      to: 'fising.navi.123@gmail.com',
      subject: 'お問い合わせ通知'
    )
  end
end
