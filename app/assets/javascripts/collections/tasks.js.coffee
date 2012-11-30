class Todo.Collections.Tasks extends Backbone.Collection
	model: Todo.Models.Task
	url: '/api/tasks'
	
	#remember to change rails model const (task.rb)
	@TODO : 0
	@WAITING : 2
	@NOTE : 3
	@EMAIL : 5
	
	roots: ->
		@.select (task)->
			return task.get('parent_id') == 0
	
	children: (parent_id)->		
		@.select (task)->
			return task.get('parent_id') == parent_id