class Studycache.Views.FieldsIndex extends Backbone.View

  template: JST['fields/index']

  render: (fields) -> 
  	$(@el).html(@template(fields:fields.fields))
  	@