class Studycache.Collections.Fields extends Backbone.Collection
    url: window.location

    initialize: ->
    	@.bind("change:pos", (e)=>
    		elements = []
    		movementType = e.get("movement")
    		modelPosition = e.get("pos")
    		if movementType != undefined
    			_.each(@.models, (model)->
    					if model.get("pos") == e.get("pos")
            	            elements.push(model)
    					    )
            	
    			_.each(elements, (model)->
    				    movement = model.get("movement")
    				    if movement == undefined
    				    	if movementType == "up"
    				    		position = modelPosition + 1
    				    		model.set("pos", position)
    				    	else
    				    		position = modelPosition - 1
    				    		model.set("pos", position)
    			)
    	)

    comparator:(field)->
        field.get("pos")
