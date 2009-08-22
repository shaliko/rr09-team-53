class DoclatesController < ApplicationController
  before_filter :find_user
  before_filter :find_doclate,      :except => [:index, :new, :create]
  before_filter :require_user,      :except => [:index, :show]
  before_filter :check_permissions, :except => [:index, :show]

  def index
    @doclates = (is_owner?(@user) ? @user.doclates.all : @user.doclates.public).paginate :page => params[:page]
  end

  def show
    check_permissions if @doclate.private
  end

  def new
    @doclate = @user.doclates.build
  end

  def create
    @doclate = @user.doclates.new(params[:doclate])
    if @doclate.save
      flash[:notice] = 'New doclate created successfully'
      redirect_to user_doclate_path(@user, @doclate)
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @doclate.update_attributes(params[:doclate])
      flash[:notice] = 'Doclate updated successfully'
      redirect_to user_doclate_path(@user, @doclate)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @doclate.destroy
    flash[:notice] = 'Doclate deleted successfully'
    redirect_to user_doclates_path(@user)
  end

  private
  def find_user
    @user = User.find_by_id(params[:user_id])
    if @user.blank?
      flash[:error] = 'User not found'
      redirect_to root_path
    end
  end

  def find_doclate
    @doclate = @user.doclates.find_by_id(params[:id])
  end

  def check_permissions
    unless is_owner?(@user)
      flash[:error] = 'Access denied'
      redirect_to user_doclates_path(@user)
    end
  end

end
