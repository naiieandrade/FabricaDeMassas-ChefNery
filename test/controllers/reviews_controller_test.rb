require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    log_in(users(:one))
    @review = reviews(:one)
  end

  test "should get edit" do
    get :edit, id: @review
    assert_response :success
  end

  test "should update review" do
    patch :update, id: @review, review: { comment: @review.comment, rating: @review.rating }
    assert_redirected_to review_path(assigns(:review))
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete :destroy, id: @review
    end

    assert_redirected_to reviews_path
  end
end
