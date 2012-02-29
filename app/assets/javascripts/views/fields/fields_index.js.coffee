class Studycache.Views.FieldsIndex extends Backbone.View

  template: JST['fields/index']

  render: () -> 
  	$(@el).html(@template)
  	@