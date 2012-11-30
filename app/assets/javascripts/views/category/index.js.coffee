class Todo.Views.CategoriesIndex extends Backbone.View
	selected: undefined
	template: JST['categories/index']
	events: 
		'click li': 'click'

	render: ->
		$(@el).html(@template)
		
		_.each @collection.models, @renderCategory, @
		
		@
		
	renderCategory: (category)->
		view = new Todo.Views.CategoriesCategory(model: category)
		$(@el).find('.categories').append(view.render().el)
		
	click: (e)->
		@setSelected($(e.target).catch().attr('data-id'))
		
	setSelected: (id)->
		@selected.removeClass('selected') if @selected
		@selected = $(@el).find('li[data-id="' + id + '"]')
		@selected.addClass('selected')