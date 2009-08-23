class DocumentsController < ApplicationController
  before_filter :require_user
  before_filter :find_user
  before_filter :check_permissions
  before_filter :find_document, :except => [:index, :new, :create]
  before_filter :find_doclate,  :only => [:new, :create]

  def index
    @documents = @user.documents.paginate(:page => params[:page])
  end

  def show
  end

  def new
    @document = @user.documents.build
    @document.doclate = @doclate
    @document.title = @doclate.title
  end

  def create
    @document = @user.documents.new(params[:document])
    @document.doclate = @doclate
    @document.body_markdown = Document.replace_fields(params[:fields], @doclate.body_markdown)

    if @document.save
      flash[:notice] = 'New document created successfully'
      redirect_to user_document_path(@user, @document)
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @document.update_attributes(params[:document])
      flash[:notice] = 'Document updated successfully'
      redirect_to user_document_path(@user, @document)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @document.destroy
    flash[:notice] = 'Document deleted successfully'
    redirect_to user_documents_path(@user)
  end

  private
  def find_user
    @user = User.find_by_id(params[:user_id])
    if @user.blank?
      flash[:error] = 'User not found'
      redirect_to root_path
    end
  end

  def find_document
    @document = @user.documents.find_by_id(params[:id])
    if @document.blank?
      flash[:error] = 'Document not found'
      redirect_to user_documents_path(@user)
    end
  end

  def find_doclate
    @doclate = @user.doclates.find_by_id(params[:doclate_id])
    if @doclate.blank?
      flash[:error] = 'Doclate not found'
      redirect_to user_documents_path(@user)
    end
  end

  def check_permissions
    unless is_owner?(@user)
      flash[:error] = 'Access denied'
      redirect_to root_path
    end
  end


end