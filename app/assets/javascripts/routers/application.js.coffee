class Todo.Routers.Application extends Backbone.Router
	routes:
		'category/:id': 'showCategory'
		
	initialize: ->
		App.Views.CategoriesIndex = new Todo.Views.CategoriesIndex(collection: App.Collections.Category)
		$('aside').html(App.Views.CategoriesIndex.render().el)
	
	showCategory: (id)->	
		category = App.Collections.Category.get(id)
		App.Views.TasksIndex = new Todo.Views.TasksIndex(category:category, collection: category.get('tasks'))
		$('section#tasks').html(App.Views.TasksIndex.render().el)
		
		App.Views.CategoriesIndex.setSelected(id)