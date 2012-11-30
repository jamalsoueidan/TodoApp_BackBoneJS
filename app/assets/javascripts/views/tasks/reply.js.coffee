class Todo.Views.TasksReply extends Backbone.View
	template: JST['tasks/reply']
	tagName: 'li'
	events:
		'click a#deleteReply'		: 'deleteReply'
		'click input.replyCheckbox'	: 'toggleCheckbox'

	render: ->
		$(@el).addClass('reply')
		$(@el).addClass('status' + @model.get('status'))
		$(@el).html(@template(@model.toJSON()))
		
		@updateReply()
		
		@
		
	deleteReply: (e)->
		@model.destroy()
		#App.Collections.Task.remove(@model)
		@model.trigger('remove-reply', @model, @)
		$(@el).fadeOut 300, ->
			 $(this).remove();
		
	toggleCheckbox: (e)->
		@model.set(done: $(e.target).is(':checked'))
		@model.save()
		
		@updateReply()
		
	updateReply: ->
		if @model.get('done')
			$(@el).find('input.replyCheckbox').attr('checked', true);
			$(@el).find('.replyBody').addClass('done')
		else
			$(@el).find('input.replyCheckbox').attr('checked', false);
			$(@el).find('.replyBody').removeClass('done')
			