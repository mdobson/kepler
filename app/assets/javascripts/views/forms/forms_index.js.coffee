class Studycache.Views.FormsIndex extends Backbone.View

  template: JST['forms/index']

  render: () -> 
  	$(@el).html(@template)
  	@