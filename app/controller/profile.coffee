class ProfileCtrl extends Monocle.Controller

	events: 
		"tap input#datepicker"  : "onDatePicker"

	onDatePicker: ->
		console.log 'aa'
		option = {date: new Date(), mode: 'date'}
		datePicker.show(option, (date) ->
			$$('#datepicker').val(date)
		)


__Controller.Profile = new ProfileCtrl "section#profile"