class LikesController < ApplicationController

  def create
    @like = Like.where(likeable_id: params[:likeable_id], likeable_type: params[:likeable_type], user: current_user)
    if @like.present?
      if @like.first.liked.eql?(true)
        @like.first.update(liked: false)
      else
        @like.first.update(liked: true)
      end
      @like = @like.first
    else
      @like = Like.create(likeable_id: params[:likeable_id], likeable_type: params[:likeable_type], user: current_user, liked: true)
    end

    @count = Like.where(likeable_id: params[:likeable_id], likeable_type: params[:likeable_type], liked: true)
    flash[:success] = "Like Counted!"
  end

end