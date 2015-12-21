$ ->
  $vehicleTypesSelect = $('#vehicle-type-id')
  $vehicleCategoriesSelect = $('#vehicle-categories-id')
  $ecologicalClassesSelect = $('#ecological-class-id')
  $yearSelect = $('#vehicle-year')

  if $yearSelect.length != 0
    $yearSelect.selectize
      create: true
      valueField: 'vehicle-year'
      render:
        option_create: (data, escape) ->
          return '<div class="create">' + escape(data.input) + '&hellip;</div>'

  if $vehicleCategoriesSelect.length != 0
    $vehicleCategoriesSelect.selectize
      create: true,
      valueField: 'vehicle-categories-id'
      render:
        option_create: (data, escape) ->
          return '<div class="create">' + escape(data.input) + '&hellip;</div>'

  if $vehicleTypesSelect.length != 0
    $vehicleTypesSelect.selectize
      create: true,
      valueField: 'vehicle-type-id'
      render:
        option_create: (data, escape) ->
          return '<div class="create">' + escape(data.input) + '&hellip;</div>'

  if $ecologicalClassesSelect.length != 0
    $ecologicalClassesSelect.selectize
      create: true,
      valueField: 'ecological-class-id'
      render:
        option_create: (data, escape) ->
          return '<div class="create">' + escape(data.input) + '&hellip;</div>'
