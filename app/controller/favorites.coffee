class FavoritesCtrl extends Monocle.Controller
	events: 
		"tap article#art-favorites ul li"    	  : "onTapStablishment"
		"swipeLeft article#art-favorites ul li"   : "onSwipeLeftStablishment"
		"tap button[data-action=logout]"          : "logout"

	initialize: ->
			url = "http://app-back.eu1.frbit.net/api/user/favorites"
			# localStorage.getItem('token')
			data = {token: 'eccbc87e4b5ce2fe28308fd9f2a7baf3'}
			Lungo.Service.post(url, data, parseResponse, "json")
	
	parseResponse = (data) ->
		if data.status == 200
			$$('article#art-favorites ul').html('')
			view = new __View.Favorites model: data
			view.append data
			Lungo.Router.section 'favorites'
		else
			console.log data
			
		Lungo.Notification.hide() 

	onTapStablishment: (e) ->
		Lungo.Notification.show()
		id = e.currentTarget.id
		__Controller.Establishment.initialize id

	onSwipeLeftStablishment: (e) ->
		id = e.currentTarget.id
		console.log 'swipeLeft', id

	logout: ->
		do __Controller.Main.onLogout

__Controller.Favorites = new FavoritesCtrl "section#favorites"