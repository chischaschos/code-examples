$ ->
  window.CurrencyRateView = Backbone.View.extend
    tagName: 'tr'

    template: Handlebars.compile $('#rate_template').html()

    # Properties must be retrieved using get method so callbacks may be triggered
    render: ->
      @$el.html @template(@model.attributes)
      @


  # Passing a single object to extend in order to avoid precedence errors
  window.CurrencyRatesCollection = Backbone.Collection.extend
    url: '/rates'


  window.CurrencyRatesView = Backbone.View.extend
    # By creating an el element it will contain our the app
    el: 'table#rates tbody'

    initialize: ->
      @currencyRates =  @options.currencyRates
      # Third parameter is context, so I'm passing @(this) so I can keep
      # the CurrencyRatesView reference
      @currencyRates.bind 'reset', @addAll, @

    addAll: ->
      # Secong parameter is context, so I'm passing @(this) so I can keep the
      # CurrencyRatesView reference
      @currencyRates.each @addOne, @

    addOne: (currencyRate) ->
      currencyRateView = new CurrencyRateView model: currencyRate
      # @$el($(this.el)) is already cached so let's use it to append our single
      # CurrencyRateView instance rendered el elements
      @$el.append currencyRateView.render().el

    render: ->
      @$el.html('')
      @currencyRates.fetch()


  window.ToolBarView = Backbone.View.extend
    el: '.navbar .container'

    initialize: ->
      @currencyRatesView =  @options.currencyRatesView

    events:
      'click #refresh': "refreshRates"

    refreshRates: ->
      @currencyRatesView.render()


  window.currencyRates = new CurrencyRatesCollection

  window.currencyRatesView = new CurrencyRatesView
    currencyRates: currencyRates

  window.toolBarView = new ToolBarView
    currencyRatesView: currencyRatesView
