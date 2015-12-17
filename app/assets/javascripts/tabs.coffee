$ ->
  $('.js-tab-header').on 'click', (e) ->
    e.preventDefault()
    $container = $(@).closest('.media-tabs')
    $container.find('.js-tab-header').removeClass('active')
    $(@).addClass('active')

    $container.find('.item-tab').addClass('hidden')
    tab = $(@).data('tab')
    $container.find(".item-tab[data-tab=#{tab}]").removeClass('hidden')

    return if $('.gigs-title').length == 0
    $container.prev().find('.gigs-title').addClass('hidden')
    $container.prev().find(".#{$(@).text().toLowerCase()}-gigs").removeClass('hidden')
