Webpatas.Galery =
  init: ->
    $galeryToggler = $('.js-galeryToggler')

    $galeryToggler.on('click', (e) ->
      hash = $(this).data('target')
      $("#{hash}").siblings().removeClass('is-active')
      $("#{hash}").addClass('is-active')
    )
