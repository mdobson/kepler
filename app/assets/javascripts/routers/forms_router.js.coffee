class Studycache.Routers.Forms extends Backbone.Router

	routes:
		'':'index'
		'pages/:id':'showpages'

	index: () -> 
		view = new Studycache.Views.FormsIndex()
		$("#container").html(view.render().el)

	showpages: (id) -> alert "form #{id}"

