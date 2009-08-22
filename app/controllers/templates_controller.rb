class TemplatesController < ApplicationController
  before_filter :find_user

  def index
    @templates = @user.templates.paginate :page => params[:page]
  end

  def new
    @template = @user.templates.new
  end

  def create
    @template = @user.templates.new(params[:template])
    if @template.save
      flash[:notice] = 'New template create successfully'
      redirect_to user_template_path(@user, @template)
    else
    end
  end

  private
  def find_user
    @user = User.find_by_id(params[:user_id])
    if @user.blank?
      flash[:error] = 'User not found!'
      redirect_to root_path
    end
  end

end
