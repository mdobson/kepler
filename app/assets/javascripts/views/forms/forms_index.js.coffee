class Studycache.Views.FormsIndex extends Backbone.View

  template: JST['forms/index']

  render: () ->
    $(@el).html(@template)
    @form = new Studycache.Collections.Forms()
    @

  initialize: () ->
    @view = new Studycache.Views.FieldsIndex(parent : @)

  events: () ->
    "click #addFieldBtn" : "addField",
    "click .field" : "clicked",
    "click #saveField" : "saveField"


  addField: () -> 
    field = new Studycache.Models.Field({name : "new field", id : @form.length + 1})
    @currentField = field
    @infoView = new Studycache.Views.FieldsDetail(parent : @)
    @form.add(field)
    $("#fields").html(@view.render(@form).el)
    $("#fieldDets").html(@infoView.render(@currentField).el)
    $(".field").removeClass "alert-error"
    $(".field").addClass "alert-success"
    $("#"+@currentField.id).addClass "alert-error"
    
  clicked: (e) ->
    e.preventDefault()
    $(".field").removeClass "alert-error"
    $(".field").addClass "alert-success"
    $(e.currentTarget).removeClass "alert-success"
    $(e.currentTarget).addClass "alert-error"
    @currentField = @form.get($(e.currentTarget).attr("id"))
    $("#fieldDets").html(@infoView.render(@currentField).el)

  saveField: () ->
    questionText = $("#question").val()
    helpText = $("#help").val()
    typeText = $("#type").val()
    nullableText = $("#nullable").val()
    @currentField.set(question: questionText, helptext: helpText, datatype: typeText, blank: nullableText)
    $("#fields").html(@view.render(@form).el)

    