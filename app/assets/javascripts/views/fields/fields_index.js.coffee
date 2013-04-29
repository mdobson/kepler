class Studycache.Views.FieldsIndex extends Backbone.View

  template: JST['fields/index']

  events:
    "change input.question" : "questionChange"
    "click .up_vote" : "upvoteQuestionPoint"
    "click .down_vote" : "downvoteQuestionPoint"
    "click .edit" : "openModal"
    "click .delete" : "deleteField"
  
  initialize: (model)->
    _.bindAll(this, "questionChange")
    @model = model
    @model.model.bind("change:question", ()=>
      $(@el).find(".question").val(@model.model.get("question")))
    @model.model.bind("change:datatype", ()=>
      $(@el).find(".datatype").html(@model.model.get("datatype")))
    @model.model.bind("change:pos", ()=>
      $(@el).find(".position").html(@model.model.get("pos")))

  render: () -> 
  	$(@el).html(@template(@model))
  	@

  error: () ->
    $(@el).removeClass("alert-info")
    $(@el).addClass("alert-error")

  questionChange: ->
  	inputElement = $(@el)
  	question = inputElement.find(".question").val()
  	@model.model.set(question:question)
  	
  openModal: ->
    inputElement = $(@el)
    modalElement = inputElement.find("#modal")
    modalElement.html("")
    modal = new Studycache.Views.FieldsModal(model:@model)
    modalElement.html(modal.render().el)

  closeModal: ->
    inputElement = $(@el)
    inputElement.find(".modal").modal("hide")

  upvoteQuestionPoint: ->
    currentPosition = @model.model.get("pos")
    newPosition = currentPosition - 1
    @model.model.set("movement","up")
    @model.model.set("pos", newPosition)

  deleteField: ->
    @model.model.set("delete",true)

  downvoteQuestionPoint: ->
    currentPosition = @model.model.get("pos")
    newPosition = currentPosition + 1
    @model.model.set("movement","down")
    @model.model.set("pos", newPosition)
