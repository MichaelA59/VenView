class VotesController < ApplicationController
  def create
    new_vote = Vote.create(vote_params)
    redirect_to banana_path(new_vote.review.banana)
  end

  def update
    this_vote = Vote.find(params[:id])
    this_vote.up_or_down = if this_vote.up_or_down === "upvote"
                             "downvote"
                    it(
      :user_id,
      :review_id,
      :up_or_down
    )
  end
end
