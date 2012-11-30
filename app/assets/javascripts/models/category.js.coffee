class Todo.Models.Category extends Backbone.RelationalModel
	urlRoot: '/api/categories'
	
	relations: [{
	        type: Backbone.HasMany,
	        key: 'tasks',
	        relatedModel: 'Todo.Models.Task',
	        collectionType: 'Todo.Collections.Tasks',
	        reverseRelation: {
	            key: 'category'
	        }
	    }]