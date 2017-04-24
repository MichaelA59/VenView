class VotesController < ApplicationController

  def create
    new_vote = Vote.create(vote_params)
    redirect_to venue_path(new_vote.review.venue)
  end

  def update
    this_vote = Vote.find(params[:id])
    if this_vote.up_or_down === "upvote"
      this_vote.up_or_down = "downvote"
    else #otherwise, this_vote.up_or_down === "downvote"
      this_vote.up_or_down = "upvote"
    end
    this_vote.save
    redirect_to venue_path(this_vote.review.venue)
  end

  def destroy
    this_vote = Vote.find(params[:id])
    this_vote.destroy

    redirect_to venue_path(this_vote.review.venue)
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
