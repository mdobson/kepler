class Studycache.Collections.Fields extends Backbone.Collection
    url: window.location

    initialize: ->
        @.bind("change:pos", (e)=>
            console.log @
            elements = []
            if e.get("pos") > @length
                e.set("pos", @length)
            if e.get("pos") < 1
                e.set("pos", 1)
            movementType = e.get("movement")
            modelPosition = e.get("pos")
            if movementType != undefined and movementType != "manual"
                _.each @.models, (model)->
                        if model.get("pos") == e.get("pos")
                            elements.push(model)
                
            	
                    _.each elements, (model)->
                        movement = model.get("movement")
                        if movement == undefined
                            if movementType == "up"
                                position = modelPosition + 1
                                model.set("pos", position)
                            else if movementType == "down"
                                position = modelPosition - 1
                                model.set("pos", position)
                            else
                                position = modelPosition
                                model.set("pos", position)
                             

                    $("#fieldcontainer").html("")
                    @sort()
                _.each @models, (model)->
                    field = new Studycache.Views.FieldsIndex({model:model})
                    $("#fieldcontainer").append(field.render().el)
                e.unset("movement")
            else if movementType == "manual"
                console.log "manual"
                $("#fieldcontainer").html("")
                @sort()
                _.each @models, (model)->
                    field = new Studycache.Views.FieldsIndex({model:model})
                    $("#fieldcontainer").append(field.render().el)
                            
        )

        @.bind("change:delete", (e)=>
            @.remove(e)
            indice = 0
            $("#fieldcontainer").html("")
            _.each @models, (model)->
                    indice = indice + 1
                    model.set("pos", indice)
                    field = new Studycache.Views.FieldsIndex({model:model})
                    $("#fieldcontainer").append(field.render().el)
            )


    comparator:(field)->
        field.get("pos")
