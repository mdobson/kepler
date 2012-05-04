class Studycache.Routers.Forms extends Backbone.Router
	routes:
		'': 'index'

	index: ->
        view = new Studycache.Views.FormsIndex(collection: @collection)
        $("#app").html(view.render().el)
        text = new Studycache.Models.Field(datatype: "Text")
        @collection.add(text)
        field = new Studycache.Views.FieldsIndex({model:text})
        $("#fieldcontainer").html(field.render().el)
		
	initialize: ->
		@collection = new Studycache.Collections.Fields()

