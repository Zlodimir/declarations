module Concerns::ErrorsHandler
  def render_not_found
    respond_to do |format|
      format.html { render template: 'errors/not_found', status: :not_found }
      format.json { render nothing: true, status: :not_found }
      format.xml  { render xml: { error: 'Not found' }, status: :not_found }
      format.any  { render nothing: true, status: :not_found }
    end

    return
  end
end
