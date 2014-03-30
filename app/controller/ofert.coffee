class OfertCtrl extends Monocle.Controller

	events: 
		"tap a#back"       		: "onBack"
		"tap nav#addFavorite"   : "onAddFavorite"

	initialize: (data) ->
		$$('section#ofert').html('')
		view = new __View.Ofert model: data
		view.append data
		 
		Lungo.Router.section 'ofert'
		Lungo.Notification.hide()

	onBack: ->
		do __Controller.Main.initialize

	onAddFavorite: ->
		console.log 'aa'

__Controller.Ofert = new OfertCtrl "section#ofert"