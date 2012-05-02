class Studycache.Views.FormsIndex extends Backbone.View

  template: JST['forms/index']

  events:
  	'click #text' : 'addField'
  	'click #save' : 'saveForm'

  render: ->
  	$(@el).html(@template())
  	@

  initialize: (collection)->
  	@collection = collection.collection
  	@fields = new Studycache.Views.FieldsIndex()
  	
  addField: () ->
  	text = new Studycache.Models.Field()
  	@collection.add(text)
  	$("#fieldcontainer").html(@fields.render(fields:@collection).el)

  saveForm: () ->
  	alert JSON.stringify @collection