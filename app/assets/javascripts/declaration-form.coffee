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

  $('#declaration_vehicle_power_hp').on 'input', (e) ->
    res = (parseFloat($(@).val()) * 0.7355).toFixed(2)
    $('#declaration_vehicle_power_kvt').val(res)

  $('#declaration_vehicle_power_kvt').on 'change', (e) ->
    return if $('#declaration_vehicle_power_hp').val() != ''
    res = (parseFloat($(@).val()) * 1.3596).toFixed(2)
    $('#declaration_vehicle_power_hp').val(res)        
