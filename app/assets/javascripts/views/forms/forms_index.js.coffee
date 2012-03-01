class Studycache.Views.FormsIndex extends Backbone.View

  template: JST['forms/index']

  render: () -> 
  	$(@el).html(@template)
  	@form = new Studycache.Collections.Forms()
  	@

  events: () ->
  	"click #addFieldBtn" : "addField"


  addField: () -> 
    field = new Studycache.Models.Field({name : "new field", id : @form.length + 1})
    view = new Studycache.Views.FieldsIndex(parent : @)
    infoView = new Studycache.Views.FieldsDetail(parent : @)
    $("#fields").append(view.render(field.get("id")).el)
    $("#fieldDets").html(infoView.render(field.get("id")).el)
    @form.add(field)