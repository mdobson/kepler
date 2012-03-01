class Studycache.Views.FieldsIndex extends Backbone.View

  template: JST['fields/index']

  render: (id) -> 
  	$(@el).html(@template(id : id))
  	@

  events: () ->
  	"click .field" : "clicked"

  clicked: (e) ->
  	e.preventDefault()
  	$(".field").removeClass "alert-success"
  	$(e.currentTarget).removeClass "alert-block"
  	$(e.currentTarget).addClass "alert-success"
  	#alert $(e.currentTarget).attr("id")


