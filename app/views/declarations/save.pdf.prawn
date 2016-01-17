prawn_document(force_download: true, filename: "#{t('statement_declaration.declaration_block.header')}.pdf", page_size: 'A4', margin: 15) do |pdf|
  render 'show', pdf: pdf
end
