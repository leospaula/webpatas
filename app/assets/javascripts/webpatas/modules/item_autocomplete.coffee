Webpatas.ItemAutocomplete =
  init: ->
    items = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      remote: {
        url: '/items.json?q=%QUERY',
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

    $('#remote .typeahead').typeahead(null, {
      name: 'best-pictures',
      display: 'value',
      source: items
    })

    $(document).on('typeahead:select', (event, obj) ->
      $('#autocomplete-result').val(obj.id)
      $('#autocomplete-result-type').val('t')
    )
