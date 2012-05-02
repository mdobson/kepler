class Studycache.Routers.Forms extends Backbone.Router
	routes:
		'': 'index'

	index: ->
		view = new Studycache.Views.FormsIndex(collection: @collection)
		$("#app").html(view.render().el)
		
	initialize: ->
		@collection = new Studycache.Collections.Fields()

