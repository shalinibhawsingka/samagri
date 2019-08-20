require 'test_helper'

class UsersMailerTest < ActionMailer::TestCase
  test "Update" do
    mail = UsersMailer.Update
    assert_equal "Update", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
