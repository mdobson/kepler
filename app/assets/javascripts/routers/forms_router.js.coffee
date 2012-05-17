class Studycache.Routers.Forms extends Backbone.Router
	routes:
		'': 'index'
		':id' : 'getform'

	index: ->
        view = new Studycache.Views.FormsIndex(collection: @collection, formid: -1)
        $("#app").html(view.render().el)
        text = new Studycache.Models.Field(datatype: "Text", pos:1, question:"Subject ID")
        @collection.add(text)
        field = new Studycache.Views.FieldsIndex({model:text})
        $("#fieldcontainer").html(field.render().el)
		
	initialize: ->
		@collection = new Studycache.Collections.Fields()

	getform:(id)->
		#alert id
		form = new Studycache.Models.Form()
		form.fetch({url:"#{form.url.origin}#{form.url.pathname}.json?id=#{id}", success:(model, response)-> 
                fields = JSON.parse model.get("fields")
                collection = new Studycache.Collections.Fields(fields)
                view = new Studycache.Views.FormsIndex(collection:collection, id)
                console.log view
                $("#app").html(view.render().el)
                $("#name").val(model.get("name"))
                _.each(collection.models, (model)->
                    field = new Studycache.Views.FieldsIndex({model:model})
                    $("#fieldcontainer").append(field.render().el)
                )})

