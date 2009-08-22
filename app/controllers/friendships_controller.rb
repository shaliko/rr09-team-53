class FriendshipsController < ApplicationController
  before_filter :require_user

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    respond_to do |format|
      if @friendship.save
        format.html do
          flash[:notice] = "Added friend."
          redirect_to root_url
        end
      else
        format.html do
          flash[:error] = "Unable to add friend."
          redirect_to root_url
        end
      end
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    respond_to do |format|
      format.html do
        flash[:notice] = "Removed friendship."
        redirect_to current_user
      end
    end
  end

end
