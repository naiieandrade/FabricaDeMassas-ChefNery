require 'test_helper'

class OrderEmailTest < ActionMailer::TestCase
  test "order_request" do
    mail = OrderEmail.order_request(users(:one), orders(:one))
    assert_equal "Novo pedido efetuado!", mail.subject
    assert_equal ["chefenerymassas@gmail.com"], mail.to
    assert_equal ["chefenerymassas@gmail.com"], mail.from
  end

end
