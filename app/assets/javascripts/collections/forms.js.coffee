class Studycache.Collections.Forms extends Backbone.Collection
	model: Studycache.Models.Field
	url: () ->
		window.location
	save : () ->
		fields = JSON.stringify @
		form = new Studycache.Models.Form({data : fields})
		form.save()
		alert form.url()
