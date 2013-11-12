#= require backbone

#= require hamlcoffee

#= require_self

window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    console.log 'Hello from Backbone!'

class App.View extends Backbone.View

  constructor: (options)->
    view = this

    # init I18n
    @I18n =
      t: (k, v = {})->
        k = "#{view.I18n_namespace}.#{k}" if view.I18n_namespace
        I18n.t k, v

    super options

  # options:
  # - data
  # - success
  # - error
  renderTemplate: (options)->
    whenAvailable = =>
      options.success? App.Templates[@templateName] _.extend(options.data || {},
        I18n: @I18n
      )

    if App.Templates? and @templateName of App.Templates
      whenAvailable()
    else
      $.ajax
        url: App.templatesMap[@templateName]
        dataType: "script"
        success: whenAvailable
        error: ->
          console.error "WTF ?!?"
          options.error?()

  killEvent: (e)->
    if e
      e.stopImmediatePropagation()
      e.stopPropagation()
      e.preventDefault()

$ ->
  App.initialize()