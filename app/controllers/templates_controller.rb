class TemplatesController < ApplicationController
  before_filter :find_user
  before_filter :find_template,     :except => [:index, :new, :create]
  before_filter :require_user,      :except => [:index, :show]
  before_filter :check_permissions, :except => [:index, :show]

  def index
    @templates = (is_owner?(@user) ? @user.templates.all : @user.templates.public).paginate :page => params[:page]
  end

  def show
    check_permissions if @_template.private
  end

  def new
    @_template = @user.templates.build
  end

  def create
    @_template = @user.templates.new(params[:template])
    if @_template.save
      flash[:notice] = 'New template created successfully'
      redirect_to user_template_path(@user, @_template)
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @_template.update_attributes(params[:template])
      flash[:notice] = 'Template updated successfully'
      redirect_to user_template_path(@user, @_template)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @_template.destroy
    flash[:notice] = 'Template deleted successfully'
    redirect_to user_templates_path(@user)
  end

  private
  def find_user
    @user = User.find_by_id(params[:user_id])
    if @user.blank?
      flash[:error] = 'User not found'
      redirect_to root_path
    end
  end

  def find_template
    @_template = @user.templates.find_by_id(params[:id])
  end

  def check_permissions
    unless is_owner?(@user)
      flash[:error] = 'Access denied'
      redirect_to user_templates_path(@user)
    end
  end

end
