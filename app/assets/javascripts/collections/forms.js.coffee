class Studycache.Collections.Forms extends Backbone.Collection
	model: Studycache.Models.Field
	url: () ->
		window.location
	save : () ->
		fields = JSON.stringify @
		name = $("#form-name").val()
		form = new Studycache.Models.Form({name:name,data :fields})
		form.save({name:name,data:fields},{success: 
			(model,response)-> alert JSON.stringify response})
		#alert form.url()