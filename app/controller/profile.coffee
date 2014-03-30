class ProfileCtrl extends Monocle.Controller

	events: 
		"tap input#datepicker"  : "onDatePicker"

	onDatePicker: ->
		option = {date: new Date(), mode: 'date'}
		datePicker.show(option, (date) ->
			sereyomaestro = "si maestro soy yo"
			$$('#datepicker').val(sereyomaestro)
		)

	#$('#datepicker').val 'date'

__Controller.Profile = new ProfileCtrl "section#profile"