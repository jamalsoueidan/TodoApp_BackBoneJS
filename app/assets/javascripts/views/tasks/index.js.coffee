class Todo.Views.TasksIndex extends Backbone.View
	selected: undefined
	category: undefined
	prepend: false
	template: JST['tasks/index']
	events:
		'keypress input#body': 'keyPress'
		'click li': 'click'
	initialize: ->
		@category = @options.category

	render: ->
		$(@el).html(@template)
		@collection.on('add', @addTask, @)

		$(@el).find('#body').prompt();
		
		# if collection is empty then type out message about that
		if @collection.roots().length == 0 
			$(@el).find('#tasks').html('<i>Type your first task</i>')
		else
			_.each(@collection.roots(), @addTask, @)
			@prepend = true
			
		$(@el).find("ul#tasks").sortable(handle: 'img', axis: 'y', opacity: 0.8, helper: 'clone', update: @postDataSortable)

		@
	
	addTask: (task)->
		return if task.get('parent_id') != 0

		tasks = $(@el).find('#tasks')
		#if collection was empty then clear messages inside #tasks
		if @collection.roots().length == 0
			tasks.html('')
			
		view = new Todo.Views.TasksTask(collection: @collection, model: task)
		if @prepend
			tasks.prepend(view.render().el)
		else
			tasks.append(view.render().el)
		
	keyPress: (e)->
		input = $(e.target)
		if (e.keyCode != 13)
			return
			
		@addAndClearForm(input)
		
	addAndClearForm: (input)->
		return if input.val() == ''
		task = new Todo.Models.Task(body: input.val(), parent_id: 0, status: Todo.Collections.Tasks.STARTED, category_id: @category.get('id'), sortable: 0)
		task.save()
		@collection.add(task, {at: 0})
			
		input.val('')
		input.focus()
		
	click: (e)->
		return if $(e.target).is('img') || $(e.target).is('input')
		
		@selected.removeClass('selected') if @selected
		@selected = $(e.target).catch()
		@selected.addClass('selected')
		
	postDataSortable: ->
      	$.post('/api/tasks/sort', $(this).sortable('serialize'));