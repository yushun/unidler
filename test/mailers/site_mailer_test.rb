require 'test_helper'

class SiteMailerTest < ActionMailer::TestCase
  test "creation_notice" do
    mail = SiteMailer.creation_notice
    assert_equal "Creation notice", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
