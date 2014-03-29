class EstablishmentCtrl extends Monocle.Controller
	events: 
		"tap button[data-action=logout]"     : "logout"
		"tap a[data-action=favorites]"       : "loadFavorites"
		"tap a[data-action=comments]"        : "loadComments"

	establishment = null
	initialize: (id) ->
			url = "http://app-back.eu1.frbit.net/api/establishment"
			data = {establishment_id: id}
			Lungo.Service.post(url, data, parseResponse, "json")
	
	parseResponse = (data) ->
		console.log data
		if data.status == 200

			establishment  = { establecimiento: [id: data.result[0].id, name: data.result[0].name] }

			$$('article#art-establishment').html('')
			view = new __View.Establishment model: data
			view.append data
			Lungo.Router.section 'establishment'
		else
			console.log data
			
		Lungo.Notification.hide() 

	loadFavorites: ->
		Lungo.Notification.show()
		do __Controller.Favorites.initialize

	logout: ->
		do __Controller.Main.onLogout

	loadComments: (e) ->
		id = e.currentTarget.parentElement.parentElement.parentElement.childNodes[3].childNodes[0].id

		url = "http://app-back.eu1.frbit.net/api/establishment/comments"
		data = {establishment_id: id}
		Lungo.Service.post(url, data, parseResponseComments, "json")

	parseResponseComments = (data) ->
		__Controller.Comments.initialize establishment, data

__Controller.Establishment = new EstablishmentCtrl "section#establishment"