class Todo.Views.TasksTask extends Backbone.View
	lastClassAdded: ''
	form: undefined
	header: undefined
	template: JST['tasks/task']
	tagName: 'li'
	events:
		'click'					: 'showReplies'
		'click #deleteTask'		: 'deleteTask'
		'click input.checkbox'	: 'toggleCheckbox'
	
	initialize: ->
		@model.on('remove-reply', @removedReply, @)
		@model.on('add-reply', @addedReply, @)
		
	render: ->
		$(@el).addClass('overflow-hidden')
		$(@el).addClass('task')
		$(@el).attr('id', 'task_' + @model.get('id'))
		$(@el).html(@template(@model.toJSON()))

		@updateTask()
		
		@
		
	renderForm: ->
		@form = new Todo.Views.TasksForm(model: @model)
		$('div#form').html(@form.render().el)
		
	renderHeader: ->
		@header = new Todo.Views.TasksHeader(model: @model)
		$('div#header').html(@header.render().el)
		
	showReplies: (e)->
		return if $(e.target).is('img') || $(e.target).is('input')
		
		$('ul#replies').empty()	
		#position = $('section#tasks').position()
		#getWidth = $('section#tasks').width()
		#$('section#replies').animate(left:position.left+getWidth, 300); # remember to update in replies.css
		
		@renderHeader()
		
		_.each @model.children(), @addReplyView, @

		@renderForm()
		
		#replies = $('#reply-form')
		#replies.toggle();
		
		#if replies.is(":visible")
		#	@form.reset()
			#$(@el).find('a#showReplies').html('Hide replies')
		#else
		#	$(@el).find('a#showReplies').html('Show replies')
	
	deleteTask: (e)->
		$('ul#replies').empty()
		$('div#form').html('')
		
		@model.destroy()
		$(@el).fadeOut 300, ->
			 $(this).remove();

	updateTask: ->
		$(@el).removeClass(@lastClassAdded)
		@lastClassAdded = 'status' + @model.lastChild().get('status') 
		$(@el).addClass(@lastClassAdded)
		
		done = @model.get('done')
		if done
			$(@el).find('input.checkbox').attr('checked', done);
			$(@el).addClass('done')
		else
			$(@el).removeClass('done')
		
	removedReply: (task)-> 
		return if task.get('parent_id') != @model.get('id')
		@updateTask()
		
	addedReply: (task)->
		return if task.get('parent_id') != @model.get('id')
		@addReplyView(task)
		@updateTask()
		
	addReplyView: (task)->
		view = new Todo.Views.TasksReply(collection: @collection, model: task)
		$('ul#replies').append(view.render().el)
	
	toggleCheckbox: (e)->
		@model.set(done: $(e.target).is(':checked'))
		@model.save()
		
		@updateTask()
	
		