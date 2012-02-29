class Studycache.Views.AppsIndex extends Backbone.View

  template: JST['apps/index']

  render: () -> 
  	$(@el).html(@template)
  	@

  events: () ->
  	"click #newFormBtn":"newForm"

  newForm: () ->
  	view = new Studycache.Views.FormsIndex()
  	$("#FormContent").html(view.render().el)