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
    datatype = input.find("#datatype").val()
    canblank = input.find("#canblank").val()
    question = input.find("#questionval").val()
    helptext = input.find("#helptextval").val()
    datapoint = input.find("#datapointname").val()
    defaults = input.find("#defaults").val()
    @model.model.model.set(datatype:datatype, canblank:canblank, question:question, helptext:helptext, datapoint:datapoint, defaults:defaults)
    input.find(".modal").addClass("hide")
    input.find("#backdrop").remove()
