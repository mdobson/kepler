class Studycache.Views.FieldsDetail extends Backbone.View

  template: JST['forms/field']


  render: (field) -> 
  	$(@el).html(@template(field : field))
  	@
