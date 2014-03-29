class SignupCtrl extends Monocle.Controller

	elements:
		"#txtName"                      		 : "user"
		"#txtEdad"                     		     : "age" 

	events: 
		"tap button[data-action=signup]"         : "onSignup"
		"tap button[data-action=calllogin]"      : "callLogin"

	# initialize: ->
	# 	if Parse.User.current()
	# 		do __Controller.Main.initialize 

	onSignup: ->
		if @user.val() and @age.val()
			Lungo.Notification.show() 
			localStorage.setItem("name", @user.val())
			localStorage.setItem("age", @age.val())
			@user.val      ""
			@age.val       ""
			__Controller.Main.initialize
			Lungo.Notification.hide() 
		else 
			Lungo.Notification.error "Por favor llene todos los campos",
				"Para registrarte necesitas llenar todos los campos",
				"warning-sign",
				5
	callLogin: ->
		Lungo.Router.section "login"


__Controller.Signup = new SignupCtrl "section#signup"
