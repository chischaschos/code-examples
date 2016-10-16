$ ->
  window.CommentModel = Backbone.Model.extend {}

  window.CommentsCollection = Backbone.Collection.extend {}

  window.QuestionModel = Backbone.Model.extend
    initialize: ->
      @comments = new CommentsCollection
      @comments.url = "/questions/#{@id}/comments"
      @comments.fetch()

    attributesWithComments: ->
      @set 'comments', @comments.map (comment) ->
        comment.get('text')

  window.QuestionShowView = Backbone.View.extend
    el: '#current_question'

    template: Handlebars.compile($('#question-show-template').html())

    events:
      'click .back': 'back'
      'click .submit': 'addComment'

    addComment: ->
      comment = new CommentModel text: @$('.new_comment').val()
      comment.save()

    back: ->
      @$el.fadeOut()
      questionsView.$el.fadeIn()

    render: ->
      @$el.html @template(@model.attributesWithComments().toJSON())
      @$el.fadeIn()
      @

  window.QuestionView = Backbone.View.extend
    tagName: 'li'

    template: Handlebars.compile($('#question-template').html())

    events:
      'click .delete': 'delete'
      'click .show': 'show'

    show: ->
      questionShowView = new QuestionShowView model: @model
      questionShowView.render()
      questionsView.$el.fadeOut()

    delete: ->
      @model.destroy()
      @$el.remove()

    render: ->
      @$el.html @template(@model.attributes)
      @

  window.QuestionsView = Backbone.View.extend
    el: 'ul#questions'

    initialize: ->
      questionsCollection.bind 'reset', @addAll, @

    addAll: ->
      questionsCollection.each @addOne, @

    addOne: (question) ->
      questionView = new QuestionView model: question
      @$el.append questionView.render().el

  window.QuestionsCollection = Backbone.Collection.extend
    url: '/questions'
    model: QuestionModel


  window.questionsCollection = new QuestionsCollection

  window.questionsView = new QuestionsView
