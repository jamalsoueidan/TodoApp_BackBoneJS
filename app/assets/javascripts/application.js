//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require underscore
//= require backbone
//= require .//backbone-relational
//= require .//application
//= require_tree ../templates/
//= require_tree .//models
//= require_tree .//collections
//= require_tree .//views
//= require_tree .//routers
//= require_tree .
//= require .//todo

var App = {
	Collections: {},
	Routers: {},
	Models: {},
	Views: {}
};

window.Todo = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {}
};

$.fn.extend({
	listener: {},
    catch: function() {
		if (!$(this).is('li')) 
			return $(this).closest('li')
		else
			return $(this)
	},	
	prompt: function(options) {
		var input = $(this)
		
		if(options==undefined) options = {}
		
		if (options['title']==undefined) 
			options['title'] = input.attr('title')
			
		if(options['name']) {
			if(this.listener[options['name']]) {
				this.listener[options['name']].unbind();
			}
			this.listener[options['name']] = input;
		}
		
		input.attr('value', options['title'])
		input.css('color', '#CCC')
		
		input.focusin(function() {
			input.attr('value', '');
			input.css('color', '#000')
		});
		
		input.focusout(function() {
			if (input.val() != '') return;
			input.attr('value', options['title']);
			input.css('color', '#CCC')
		});
		
	}
});