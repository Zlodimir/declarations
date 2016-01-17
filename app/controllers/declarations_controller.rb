class DeclarationsController < ApplicationController
  before_action :find_declaration, only: [:edit, :show, :update, :destroy, :save]

  def index
    @declarations = current_user.declarations.by_create_date_desc.page(params[:page])
  end

  def show
    respond_to do |format|
      format.html
      format.pdf
    end
  end

  def new
    @declaration = Declaration.new
  end

  def edit
    
  end

  def update
    if @declaration.update(declarations_params)
      redirect_to declaration_path(@declaration)
    else
      render 'edit'
    end
  end

  def create
    @declaration = Declaration.new(declarations_params())
    if @declaration.save
      redirect_to declaration_path(@declaration)
    else
      render 'new'
    end
  end

  def destroy
    if @declaration.destroy
      redirect_to :back, notice: t('messages.declaration.delete.success')
    else
      flash[:alert] = t('messages.declaration.delete.fail')
      redirect_to list_path
    end
  end

  def save
  end

  private

  def declarations_params
    params[:declaration][:user_id] = current_user.id if user_signed_in?
    params.require(:declaration).permit(Declaration.column_names)
  end

  def find_declaration
    if current_user.present?
      @declaration = current_user.declarations.find_by_id(params[:id])
    else
      @declaration = Declaration.not_belongs_to_user.find_by_id(params[:id])
    end

    unless @declaration.present?
      render_not_found
    end
  end
end
