class Studycache.Views.AppsIndex extends Backbone.View

  template: JST['apps/index']

  render: () -> 
  	$(@el).html(@template)
  	@

  events: () ->
  	"click #newFormBtn":"newForm",
  	"click #saveFormBtn":"saveForm"

  newForm: () ->
  	@formview = new Studycache.Views.FormsIndex()
  	$("#FormContent").html(@formview.render().el)

  saveForm: () ->
    alert JSON.stringify @formview.form
    @formview.form.save()