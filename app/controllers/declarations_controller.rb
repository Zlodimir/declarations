class DeclarationsController < ApplicationController
  before_action :find_declaration, only: [:edit, :show, :update]

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
      Rails.logger.debug("EBAT!!!!!!!!#{@declaration.errors.full_messages.to_sentence}")
      render 'new'
    end
  end

  private

  def declarations_params
    params.require(:declaration).permit(Declaration.column_names)
  end

  def find_declaration
    @declaration = Declaration.find_by_id(params[:id])
    unless @declaration.present?
      render_not_found
    end
  end
end
