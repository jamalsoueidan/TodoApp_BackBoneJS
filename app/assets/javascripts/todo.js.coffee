$(document).ready ->
	App.Collections.Category = new Todo.Collections.Categories
	App.Collections.Category.reset($('#container').data('categories'))
	
	#App.Collections.Task = new Todo.Collections.Tasks
	#App.Collections.Task.reset($('#container').data('tasks'))
	
	App.Routers.Application = new Todo.Routers.Application()
	Backbone.history.start()#(pushState:true)