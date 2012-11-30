class Todo.Views.TasksHeader extends Backbone.View
	template: JST['tasks/header']
		
	render: ->
		$(@el).html(@template(@model.toJSON()))

		@