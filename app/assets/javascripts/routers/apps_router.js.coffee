class Studycache.Routers.Apps extends Backbone.Router
	routes:
		'':'index'
	
	index: () -> 
		view = new Studycache.Views.AppsIndex()
		$("#container").html(view.render().el)

	
