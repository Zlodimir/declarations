module ApplicationHelper
  def wrap_input(record = nil, attribute = nil, &block)
    errors_wrapped = if record.present? && attribute.present? && record.errors[attribute].present?
      content_tag :span, record.errors[attribute].join(', '), class: 'input-error'
    end
    input_wrapped = content_tag :div, class: "input-frame #{'with-error' if errors_wrapped.present?}", &block

    input_wrapped + errors_wrapped
  end
end
