class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    # @url = "venview.herokuapp.com"

    mail(
      to: @review.venue.user.email,
      subject: "New Review for #{review.venue.name}"
    )
  end
end
