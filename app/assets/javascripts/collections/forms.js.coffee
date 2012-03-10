class Studycache.Collections.Forms extends Backbone.Collection
	model: Studycache.Models.Field
	url: () ->
		"/form_builder/new"
	save : () ->
		fields = JSON.stringify @
		form = new Studycache.Models.Form({data : fields})
		form.save()
		#alert form.url()
