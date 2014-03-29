class LoginCtrl extends Monocle.Controller

	events: 
		"tap button[data-action=login]"          : "onLogin"
		"tap button[data-action=callsignup]"     : "callSignup"

	initialize: ->
		Lungo.Notification.show()
		name = localStorage.getItem('name')
		age = localStorage.getItem('age')
		if name and age
			do __Controller.Main.initialize 
		else
			Lungo.Notification.hide()

	onLogin: ->
		if @user.val() and @password.val()
			Lungo.Notification.show() 

			url = "http://app-back.eu1.frbit.net/api/user/login"
			data = {email: @user.val(), password: @password.val()}
			Lungo.Service.post(url, data, parseResponse, "json")

			@user.val     ""
			@password.val ""
		else 
			Lungo.Notification.error "Por favor llene todos los campos",
				"Para acceder necesitas llenar todos los campos correctamente",
				"warning-sign",
				5
	parseResponse = (data) ->
		if data.status is 200
			localStorage.setItem("token", data.result.token)
			do __Controller.Main.initialize
		else
			console.log data
			do Lungo.Notification.error "Error", "Error al logearte", "warning-sign", 2

		Lungo.Notification.hide() 

	callSignup: ->
		Lungo.Router.section "signup"
		

Lungo.ready ->
	__Controller.Login = new LoginCtrl "section#login"
	do __Controller.Login.initialize
