class AdReplyMailer < ApplicationMailer
  def reply_email(ad_reply,advertisement)
    @ad_reply  = ad_reply
    @advertisement = advertisement
    @user = advertisement.user
    @email = @user.email
    mail(to: @email, subject: "Reply for Your Ad: #{advertisement.title}")
  end
end