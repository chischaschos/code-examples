$ ->
  window.CurrencyRateView = Backbone.View.extend
    # By no providing an el element it will default to an empty div

    # Properties must be retrieved using get method so callbacks may be triggered
    render: ->
      @$el.html @model.get('currency_name')
      @

  # Passing a single object to extend in order to avoid precedence errors
  window.CurrencyRatesCollection = Backbone.Collection.extend {}

  window.currencyRates = new CurrencyRatesCollection

  window.CurrencyRatesView = Backbone.View.extend
    # By creating an el element it will contain our the app
    el: 'body'

    initialize: ->
      # Third parameter is context, so I´m passing @(this) so I can keep
      # the CurrencyRatesView reference
      currencyRates.bind 'reset', @addAll, @

    addAll: ->
      # Secong parameter is context, so I´m passing @(this) so I can keep the
      # CurrencyRatesView reference
      currencyRates.each @addOne, @

    addOne: (currencyRate) ->
      currencyRateView = new CurrencyRateView model: currencyRate
      # @$el($(this.el)) is already cached so let's use it to append our single
      # CurrencyRateView instance rendered el elements
      @$el.append currencyRateView.render().el

  window.currencyRatesView = new CurrencyRatesView
