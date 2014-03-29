class MainCtrl extends Monocle.Controller

	events: 
		"tap a[data-action=locate]"   : "onLocate"
		# "tap a[data-action=hv]"       : "onHV"

	initialize: ->
		Lungo.Router.section 'main'

	# onHV: ->
	# 	Lungo.Notification.show()
	# 	Lungo.Router.section 'profile'
	# 	Lungo.Notification.hide()


Lungo.ready ->
	__Controller.Main = new MainCtrl "section#main"
	do __Controller.Main.initialize