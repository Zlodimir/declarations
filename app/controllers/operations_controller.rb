class OperationsController < ApplicationController
  def index
    @operations = params[:operation_id].present? ? Operation.by_root_operation(params[:operation_id]) : Operation.all

    respond_to do |format|
      format.html
      format.json { render json: { success: true, operations: @operations } }
    end
  end
end
