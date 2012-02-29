class Studycache.Views.FormsIndex extends Backbone.View

  template: JST['forms/index']

  render: () -> 
  	$(@el).html(@template)
  	@form = new Studycache.Collections.Forms()
  	@

  events: () ->
  	"click #addFieldBtn" : "addField"


  addField: () -> 
  	field = new Studycache.Models.Field({name : "new field"})
  	view = new Studycache.Views.FieldsIndex()
  	$("#fields").append(view.render().el)
  	@form.add(field)