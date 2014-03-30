class FavoritesCtrl extends Monocle.Controller
	events: 
		"tap article#art-favorites ul li"    	  : "onTapStablishment"

	initialize: ->
		db = window.openDatabase("SiJoven", "1.0", "Test DB", 1000000)
		db.transaction( __Controller.Favorites.Query, __Controller.Favorites.Error  )

	QuerySuccess: (tx, results) ->
    	console.log results
    
    Error: (err)->
    	console.log err

	Query: (tx) ->
		tx.executeSql( 'SELECT * FROM favorites', [], __Controller.Favorites.QuerySuccess, __Controller.Favorites.Error ) 	

	onTapStablishment: (e) ->
		Lungo.Notification.show()
		id = e.currentTarget.id
		__Controller.Establishment.initialize id

__Controller.Favorites = new FavoritesCtrl "section#favorites"