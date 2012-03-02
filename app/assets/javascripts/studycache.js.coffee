window.Studycache =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
  	new Studycache.Routers.Apps()
  	new Studycache.Routers.Forms()
  	Backbone.history.start()

$(document).ready ->
  Studycache.init()
