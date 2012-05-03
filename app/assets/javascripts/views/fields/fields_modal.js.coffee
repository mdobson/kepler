class Studycache.Views.FieldsModal extends Backbone.View

  template: JST['fields/modal']

  events:
  	"click .hide-modal" : "hideModal"

  intialize: (model)->
  	@model = model

  render: ()->
  	$(@el).html(@template(@model))
  	@

  hideModal:->
  	input = $(@el)
  	input.find(".modal").addClass("hide")