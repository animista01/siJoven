class ProfileCtrl extends Monocle.Controller

	events: 
		# "tap a[data-action=hv]"       : "onHV"
		"tap input#datepicker" : "onDatePicker"

	initialize: ->
		Lungo.Router.section 'main'

	# onHV: ->
	# 	Lungo.Notification.show()
	# 	Lungo.Router.section 'profile'
	# 	Lungo.Notification.hide()
	onDatePicker: ->
		console.log 'aa'
		option = {date: new Date(), mode: 'date'}
		datePicker.show(option, (date) ->
			Lungo.Notification.success "#{date}",
				"",
				2
			$$('#txtEmail').val(date)
		)


__Controller.Profile = new ProfileCtrl "section#profile"