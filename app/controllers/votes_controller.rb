class VotesController < ApplicationController
  def create
    new_vote = Vote.create(vote_params)
    redirect_to venue_path(new_vote.review.venue)
  end


  private

  def vote_params
    params.require(:vote).permit(
      :user_id,
      :review_id,
      :up_or_down
    )
  end
end
