class Studycache.Views.FieldsModal extends Backbone.View

  template: JST['fields/modal']

  events:
    "click .hide-modal" : "hideModal"
    "click .okay-modal" : "saveData"

  initialize: (model, attributes)->
    @model = model

  render: ()->
  	$(@el).html(@template(@model))
  	@

  hideModal:->
    input = $(@el)
    input.find(".modal").addClass("hide")
    input.find("#backdrop").remove()

  saveData:->
    input =$(@el)
    canblank = input.find("#canblank").val()
    question = input.find("#questionval").val()
    helptext = input.find("#helptextval").val()
    datapoint = input.find("#datapointname").val()
    defaults = input.find("#defaults").val()
    video = input.find("#video").val()
    numberscale = input.find("#numberscale").val()
    @model.model.model.set(canblank:canblank, question:question, helptext:helptext, datapoint:datapoint, defaults:defaults, video:video, numberscale:numberscale)
    input.find(".modal").addClass("hide")
    input.find("#backdrop").remove()
