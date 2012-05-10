class Studycache.Views.FormsIndex extends Backbone.View

  template: JST['forms/index']

  events:
    'click #text' : 'addText'
    'click #numeric' : 'addNumeric'
    'click #long' : 'addLong'
    'click #drop' : 'addDrop'
    'click #bool' : 'addBool'
    'click #save' : 'saveForm'

  render: ->
    $(@el).html(@template())
    @

  initialize: (collection, formid)->
    @collection = collection.collection
    @root = @
    @formid = formid

  addText: ->
    @addField("Text")

  addNumeric: ->
    @addField("Numeric")

  addLong: ->
    @addField("Long")

  addDrop: ->
    @addField("Dropdown")

  addBool: ->
    @addField("Bool")

  addField: (dataType) ->
    $("#fieldcontainer").html("")
    text = new Studycache.Models.Field(datatype:dataType, pos: @collection.length + 1)
    @collection.add(text)
    _.each(@collection.models, (model)->
        field = new Studycache.Views.FieldsIndex({model:model})
        $("#fieldcontainer").append(field.render().el)
      )

  refresh:->
    $("#fieldcontainer").html("")
    _.each(@collection.models, (model)->
        field = new Studycache.Views.FieldsIndex({model:model})
        $("#fieldcontainer").append(field.render().el)
      )

  saveForm: () ->
    form = new Studycache.Models.Form()
    valid = true
    name = $("#name").val()
    if name == "" || name == undefined
      valid = false
    form.set(fields:@collection, name:name, formid:@formid)
    #console.log form
    _.each(@collection.models, (model)->
        if model.has("question") == false
          valid = false
          console.log model
      )
    if valid 
      form.save({},{
        success:(m,r)->
          console.log r
          if r.success == true
            $("#success").show()
          })
    else
      $("#error").show()