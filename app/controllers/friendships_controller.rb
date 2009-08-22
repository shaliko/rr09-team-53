class FriendshipsController < ApplicationController
  before_filter :require_user

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    respond_to do |format|
      if @friendship.save
        flash[:notice] = "Added friend."
        format.html do
          redirect_to root_url
        end
        format.js
      else
        flash[:error] = "Unable to add friend."
        format.html do
          redirect_to root_url
        end
        format.js
      end
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    respond_to do |format|
      flash[:notice] = "Removed friendship."
      format.html do
        redirect_to current_user
      end
      format.js
    end
  end

end
