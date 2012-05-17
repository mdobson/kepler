window.Studycache =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    router = new Studycache.Routers.Forms()
    Backbone.history.start()

$(document).ready ->
  Studycache.init()
