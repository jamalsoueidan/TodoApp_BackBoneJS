class Todo.Views.TasksForm extends Backbone.View
	template: JST['tasks/form']
	tagName: 'span'
	events:
		'click #note':'addNote'
		'click #todo':'addTodo'
		'click #waiting':'addWaiting'
		
	render: ->
		$(@el).html(@template)
		
		$(@el).find('#body').prompt(name: 'form')

		@
		
	#waiting for action from them
	addTodo: (e)->
		e.preventDefault();		
		@reset(Todo.Collections.Tasks.TODO)

	addWaiting: (e)->
		e.preventDefault();		
		@reset(Todo.Collections.Tasks.WAITING)

	addNote: (e)->
		e.preventDefault();		
		@reset(Todo.Collections.Tasks.NOTE)

	reset: (status)->
		textarea = $('textarea#body')
		
		if textarea.val() != '' && textarea.val() != textarea.attr('title')
			task = new Todo.Models.Task(body: textarea.val(), parent_id: @model.get('id'), status: status, category_id: @model.get('category').get('id'))
			task.save();
			@model.collection.add(task)
			@model.trigger('add-reply', task, @)
		
		bodyTextArea = $('textarea#body')
		bodyTextArea.val('')
		bodyTextArea.focus()