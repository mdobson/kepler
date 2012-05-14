class Studycache.Views.Bindable extends Backbone.View

	render: ->

    if @model != null
      # Iterate through all bindings
      for selector, field of @modelBindings
        do (selector, field) =>
          console.log "binding #{selector} to #{field}"
          # When the model changes update the form
          # elements
          @model.bind "change:#{field}", (model, val)=>
            console.log "model[#{field}] => #{selector}"
            @$(selector).val(val)

          # When the form changes update the model
          [event, selector...] = selector.split(" ")
          selector = selector.join(" ")
          @$(selector).bind event, (ev)=>
            console.log "form[#{selector}] => #{field}"
            data = {}
            data[field] = @$(ev.target).val()
            @model.set data

          # Set the initial value of the form
          # elements
          @$(selector).val(@model.get(field))

    super

    @