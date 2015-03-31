class NominationsController < ApplicationController
  def new
    @nominees = User.all
    @nomination = Nomination.new
  end

  def create
    @nomination = Nomination.new(nomination_params)
    @nomination.nominee = current_user
    if @nomination.save
      redirect_to nominations_path, notice: "Thanks for your nomination!"
    else
      render :new
    end
  end

  private

  def nomination_params
    params.require(:nomination).permit(:nominee_id, :content)
  end
end
