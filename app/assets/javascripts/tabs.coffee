$ ->
  $('.js-tab-header').on 'click', (e) ->
    e.preventDefault()
    $container = $(@).closest('.media-tabs')
    $container.find('.js-tab-header').removeClass('active')
    $(@).addClass('active')

    $container.find('.item-tab').addClass('hidden')
    tab = $(@).data('tab')
    $container.find(".item-tab[data-tab=#{tab}]").removeClass('hidden')

    return if $('.declaration-form').length == 0
    $('#declaration_owner_company').val(if tab is 'fl' then 'false' else 'true')
