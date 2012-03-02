class Studycache.Views.FieldsIndex extends Backbone.View

  template: JST['fields/index']

  render: (form) -> 
  	$(@el).html(@template(form : form))
  	@


