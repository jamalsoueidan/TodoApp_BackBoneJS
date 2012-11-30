class Todo.Models.Task extends Backbone.RelationalModel
	urlRoot: '/api/tasks'
	
	lastChild: -> 
		child = @children().pop()
		return @ if !child
		return child
		
	children: -> 
		tasks = @collection.children(@get('id'))
		_.sortBy tasks, (task)->
			return task.get('created_at')