class Studycache.Collections.Forms extends Backbone.Collection
	model: Studycache.Models.Field
<<<<<<< HEAD

=======
>>>>>>> Backbonejs
	url: () ->
		window.location
	save : () ->
		fields = JSON.stringify @
		form = new Studycache.Models.Form({data : fields})
		form.save()
<<<<<<< HEAD
		#alert form.url()
=======
		alert form.url()
>>>>>>> Backbonejs
