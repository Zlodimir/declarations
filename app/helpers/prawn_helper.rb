module PrawnHelper
  def operation(pdf, declaration, operation_id, name, x, y, height = 12, leading = 0)
    if declaration.operation_id == operation_id
      begin_tag = '<u>'
      end_tag = '</u>' 
    end

    # unless declaration.operation_id == operation_id
    #   begin_tag = '<strikethrough>'
    #   end_tag = '</strikethrough>'
    # end

    pdf.bounding_box([x, y], width: 440, height: height) do
      #pdf.stroke_bounds
      pdf.text "#{begin_tag}#{name}#{end_tag}", inline_format: true, leading: leading
    end
  end
end
