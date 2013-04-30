class Studycache.Views.FormsIndex extends Backbone.View

  template: JST['forms/index']

  events:
    'click #text' : 'addText'
    'click #numeric' : 'addNumeric'
    'click #long' : 'addLong'
    'click #drop' : 'addDrop'
    'click #bool' : 'addBool'
    'click #scale' : 'addScale'
    'click #save' : 'saveForm'

  render: ->
    $(@el).html(@template())
    #note to self #{window.location.origin}#{window.location.pathname} is the magic needed to splice together routes needed to form builder metadata
    #console.log("#{window.location.origin}#{window.location.pathname}/names")
    #console.log @collection.required_id
    $.ajax({url: "#{window.location.origin}#{window.location.pathname}/names?selected_id=#{@required_form_id}", success:(response)-> 
                                                                                  $("#forms").html(response)})
    @

  initialize: (required_form_id, collection, formid)->
    @collection = collection
    @root = @
    @required_form_id = required_form_id
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

  addScale: ->
    @addField("Scale")

  addField: (dataType) ->
    $("#fieldcontainer").html("")
    text = new Studycache.Models.Field(datatype:dataType, pos: @collection.length + 1, is_subject_id: false)
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
    $("#success").hide()
    $("#error").hide()
    form = new Studycache.Models.Form()
    valid = true
    name = $("#name").val()
    required_form = $("#form_name_form_id").val()
    if name == "" || name == undefined
      valid = false

    if required_form
      form.set(required_id:required_form)

    if @formid
      form.set(formid:@formid)
    form.set(fields:@collection, name:name)
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
            window.location.hash = r.formid
            $("#success").show()
          else
            $("#error").show()
          })
    else
      $("#error").show()