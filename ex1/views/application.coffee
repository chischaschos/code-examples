$ ->
  window.CurrencyModel = Backbone.Model.extend
    defaults:
      id: ''
      currency_name: 'USD'
      rate: 1

  window.CurrencyRateView = Backbone.View.extend
    tagName: 'tr'

    template: Handlebars.compile $('#rate_template').html()

    # Properties must be retrieved using get method so callbacks may be triggered
    render: ->
      @$el.html @template(@model.attributes)
      @

  # Passing a single object to extend in order to avoid precedence errors
  window.CurrencyRatesCollection = Backbone.Collection.extend
    model: CurrencyModel

    url: '/rates'

  window.currencyRates = new CurrencyRatesCollection

  window.CurrencyRatesView = Backbone.View.extend
    # By creating an el element it will contain our the app
    el: 'table#rates tbody'

    initialize: ->
      # Third parameter is context, so I'm passing @(this) so I can keep
      # the CurrencyRatesView reference
      currencyRates.bind 'reset', @addAll, @

    addAll: ->
      # Secong parameter is context, so I'm passing @(this) so I can keep the
      # CurrencyRatesView reference
      currencyRates.each @addOne, @

    addOne: (currencyRate) ->
      currencyRateView = new CurrencyRateView model: currencyRate
      # @$el($(this.el)) is already cached so let's use it to append our single
      # CurrencyRateView instance rendered el elements
      @$el.append currencyRateView.render().el

  window.ToolBarView = Backbone.View.extend
    el: '.navbar .container'

    events:
      'click #refresh': "refreshRates"

     refreshRates: ->
       currencyRates.fetch()


  window.toolBarView = new ToolBarView
  window.currencyRatesView = new CurrencyRatesView
