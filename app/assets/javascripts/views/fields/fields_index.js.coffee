class Studycache.Views.FieldsIndex extends Backbone.View

  template: JST['fields/index']

  events:
    "change input.question" : "questionChange"
    "change input.datapoint" : "datapointChange"
    "click .up_vote" : "upvoteQuestionPoint"
    "click .down_vote" : "downvoteQuestionPoint"
    "click .edit" : "openModal"
    "click .delete" : "deleteField"
  
  initialize: (model)->
    _.bindAll(this, "questionChange")
    _.bindAll(this, "datapointChange")
    @model = model
    @model.model.bind("change:question", ()=>
      $(@el).find(".question").val(@model.model.get("question")))
    @model.model.bind("change:datapoint", ()=>
      $(@el).find(".datapoint").val(@model.model.get("datapoint")))
    @model.model.bind("change:datatype", ()=>
      $(@el).find(".datatype").html(@model.model.get("datatype")))
    @model.model.bind("change:pos", ()=>
      $(@el).find(".position").html(@model.model.get("pos")))

  render: () -> 
  	$(@el).html(@template(@model))
  	@

  questionChange: ->
  	inputElement = $(@el)
  	question = inputElement.find(".question").val()
  	@model.model.set(question:question)
  	

  datapointChange: ->
  	inputElement = $(@el)
  	datapointVal = inputElement.find(".datapoint").val()
  	@model.model.set(datapoint:datapointVal)

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
