Webpatas.MaskedMonetary =
  init: ->
    $('.js-monetary').maskMoney({allowNegative: false, thousands:'.', decimal:',', affixesStay: true});
