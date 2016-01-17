prawn_document(page_size: 'A4', margin: 15) do |pdf|
  render 'show', pdf: pdf
end
