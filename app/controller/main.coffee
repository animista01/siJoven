class MainCtrl extends Monocle.Controller
	elements:
		"#txtSearch"    			  : "search"
	events: 
		"tap a[data-action=locate]"   : "onLocate"
		"tap span#btnSearch"          : "OnSearch"

	initialize: ->
		Lungo.Router.section 'main'

	OnSearch: ->
		console.log @search.val()


Lungo.ready ->
	__Controller.Main = new MainCtrl "section#main"
	do __Controller.Main.initialize