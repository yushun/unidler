class SiteMailer < ActionMailer::Base
  default from: "sonnyhe2002+unidler@gmail.com"

  def creation_notice(address)
    @address = address

    mail to: "sonnyhe2002+unidler@gmail.com", subject: "#{@address} is added to Unidler"
  end
end
