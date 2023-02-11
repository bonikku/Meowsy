class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meow

  def create
    @comment = @meow.comments.new(comment_params.merge(user: current_user))
    respond_to do |format|
      if @comment.save
        format.turbo_stream
      else
        format.html { redirect_to meow_path(@meow), alert: "Reply could not be sent" }
      end
    end

  end

  def destroy
    @comment = @meow.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to meow_path(@meow), notice: "Comment has been deleted" }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_meow
    @meow = Meow.find(params[:meow_id])
  end
end