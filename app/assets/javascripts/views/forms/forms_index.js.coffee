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

  initialize: (collection)->
    @collection = collection.collection
    @collection.bind("change:pos", ()=>
        @refresh()
      )
    @root = @

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
    name = $("#name").val()
    form.set(fields:@collection, name:name)
    alert form.url