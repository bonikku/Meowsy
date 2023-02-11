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
  end

  private

  def meow_params
    params.require(:meow).permit(:body)
  end
end
