$ ->
  return if $('.declaration-form').length == 0

  $('#root_operation_id').on 'change', (e) ->
    e.preventDefault()
    $operationSelectRoot = $(@)
    $operationSelectChild = $('#declaration_operation_id')

    $.ajax $operationSelectRoot.data('path'),
      type: $operationSelectRoot.data('type'),
      dataType: 'json'
      data: { operation_id: $operationSelectRoot.val() }
      success: (data) ->
        $operationSelectChild.find('option').remove()
        for operation in data['operations']
          option = """<option value=#{operation.id}>#{operation.name}</option>"""
          $operationSelectChild.append(option)
        
