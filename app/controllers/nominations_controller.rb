class NominationsController < ApplicationController
  def new
    @nominees = User.all
    @nomination = Nomination.new
  end

  def create
    @nominees = User.all
    @nomination = Nomination.new(nomination_params)
    @nomination.nominator = current_user

    if @nomination.save
      redirect_to nominations_path, notice: "Thanks for your nomination!"
    else
      flash[:error] = @nomination.errors.full_messages.join(" ")
      render :new
    end
  end

  def index
    @nominations = Nomination.all
  end

  private

  def nomination_params
    params.require(:nomination).permit(:nominee_id, :content)
  end
end
