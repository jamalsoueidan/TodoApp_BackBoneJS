class Todo.Views.CategoriesCategory extends Backbone.View
	template: JST['categories/category']
	tagName: 'li'
	events: 
		'click': 'click'
		
	render: ->
		$(@el).addClass('category')
		$(@el).attr('data-id', @model.get('id'))
		$(@el).html(@template(@model.toJSON()))
		@

	click: (e)->
		Backbone.history.navigate('category/' + @model.get('id'), true)