module ApplicationHelper
  def wrap_input(record = nil, attribute = nil, &block)
    errors_wrapped = if record.present? && attribute.present? && record.errors[attribute].present?
      content_tag :span, record.errors[attribute].join(', '), class: 'input-error'
    end
    input_wrapped = content_tag :div, class: "input-frame #{'with-error' if errors_wrapped.present?}", &block

    input_wrapped + errors_wrapped
  end

  def operation_processing(declaration, operation_id, name)
    classes = operation_id == declaration.operation_id ? 'line-under' : 'line-through'
    content_tag :span, name, class: classes
  end

  def vehicle_types(declaration)
    options = VehicleType.all.map {|v| [v.name, v.name] }.unshift(['', ''])
    if declaration.vehicle_type.present?
      options << [declaration.vehicle_type, declaration.vehicle_type]
      selected = declaration.vehicle_type
    end
    options_for_select(options, selected)
  end

  def ecological_classes(declaration)
    options = EcologicalClass.all.reverse.map {|v| [v.name, v.name] }.unshift(['', ''])
    if declaration.vehicle_ecological_class.present?
      options << [declaration.vehicle_ecological_class, declaration.vehicle_ecological_class]
      selected = declaration.vehicle_ecological_class
    end
    options_for_select(options, selected)
  end

  def vehicle_categories(declaration)
    options = VehicleCategory.all.map {|v| [v.name, v.name] }.unshift(['', ''])
    if declaration.vehicle_category.present?
      options << [declaration.vehicle_category, declaration.vehicle_category]
      selected = declaration.vehicle_category
    end
    options_for_select(options, selected)
  end
end
