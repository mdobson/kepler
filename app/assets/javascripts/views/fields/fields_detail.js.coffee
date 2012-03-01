class Studycache.Views.FieldsDetail extends Backbone.View

  template: JST['forms/field']


  render: (id) -> 
  	$(@el).html(@template(id : id))
  	@
