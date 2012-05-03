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
    
  addField: () ->
    $("#fieldcontainer").html("")
    text = new Studycache.Models.Field()
    @collection.add(text)
    _.each(@collection.models, (model)->
        field = new Studycache.Views.FieldsIndex(model:model)
        $("#fieldcontainer").append(field.render().el)
      )
    
  saveForm: () ->
    form = new Studycache.Models.Form()
    name = $("#name").val()
    form.set(fields:@collection, name:name)
    alert JSON.stringify form