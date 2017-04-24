require 'test_helper'

class OrderEmailTest < ActionMailer::TestCase
  test "order_request" do
    mail = OrderEmail.order_request
    assert_equal "Order request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
