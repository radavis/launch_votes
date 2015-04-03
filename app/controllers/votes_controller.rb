class VotesController < ApplicationController
  def create
    nomination = Nomination.find(params[:nomination_id])
    @vote = Vote.new
    @vote.nomination = nomination
    @vote.user = current_user

    if @vote.save
      flash[:notice] = "Thanks for voting!"
    else
      flash[:error] = @vote.errors.full_messages.join(" ")
    end

    redirect_to nominations_path
  end
end
