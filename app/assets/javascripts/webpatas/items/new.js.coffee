Webpatas.Items ?= {}

Webpatas.Items.New =
  init: ->
    bestPictures = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      remote: {
        url: '/products.json?q=%QUERY',
        wildcard: '%QUERY',
        filter: (products) ->
          $.map(products, (product) ->
            {
              id: product[0]
              value: product[1]
            }
          )
      }
    })

    $('#remote .typeahead').typeahead({
      classNames: {
        menu: 'Autocomplete-menu',
        suggestion: 'Autocomplete-suggestion',
        cursor: 'Autocomplete-cursor'
      }
      }, {
      name: 'best-pictures',
      display: 'value',
      source: bestPictures
    })
    $(document).on('typeahead:select', (event, obj) ->
      $('#autocomplete-result').val(obj.id)
      $(event.target).parents('form').submit()
    )

  modules: -> []
