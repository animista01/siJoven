class MainCtrl extends Monocle.Controller

	events: 
		"tap a[data-action=locate]"    	     : "onLocate"
		"tap button[data-action=logout]"     : "onLogout"
		"tap li#mainHome"     				 : "onMain"
		"tap li#userFavorites"   			 : "onFavorites"
		"tap li#usercategories"   			 : "onCategories"

	initialize: ->
		name = localStorage.getItem('name')
		age = localStorage.getItem('age')
		if name and age	
			Lungo.Router.section 'main'
		else
			console.log 'no'
	onMain: ->
		Lungo.Notification.show()
		Lungo.Router.section 'main'
		Lungo.Notification.hide()

	onFavorites: ->
		Lungo.Notification.show()
		do __Controller.Favorites.initialize 

	onCategories: ->
		Lungo.Notification.show()
		Lungo.Router.section 'categories'
		Lungo.Notification.hide()


Lungo.ready ->
	__Controller.Main = new MainCtrl "section#main"
	__Controller.Main = new MainCtrl "aside#features"
	do __Controller.Main.initialize