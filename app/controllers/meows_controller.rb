class MeowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @meow = Meow.new
    @meows = Meow.all.order(created_at: :desc)
  end

  def create
    @meow = Meow.new(meow_params)
    @meow.user = current_user

    respond_to do |format|
      if @meow.save
        format.turbo_stream
      else
        format.html do
          flash[:meow_errors] = @meow.errors.full_messages
          redirect_to root_path
        end
      end
    end
  end

  def destroy
    @meow = current_user.meows.find(params[:id])
    @meow.destroy
  end

  def remeow
    @meow = Meow.find(params[:id])

    @remeow = current_user.meows.new(meow_id: @meow.id)

    respond_to do |format|
      if @remeow.save
        format.turbo_stream
      else
        format.html { redirect_back fallback_location: @meow, alert: "Couldn't remeow" }
      end
    end
  end

  private

  def meow_params
    params.require(:meow).permit(:body, :meow_id)
  end
end
