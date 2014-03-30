class FavoritesCtrl extends Monocle.Controller
	events: 
		"tap a#main"    	  : "onMain"
		"tap a#star"    	  : "onStar"

	onMain: ->
		do __Controller.Main.initialize
    
    onStar: ->
		do __Controller.Filter.initialize

__Controller.Favorites = new FavoritesCtrl "section#favorites"