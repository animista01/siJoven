class ProfileCtrl extends Monocle.Controller

	events: 
		"tap input#datepicker"  : "onDatePicker"

	onDatePicker: ->
		datePicker.show( {date: new Date(), mode: 'datetime'}, (date) ->
			$$('#datepicker').val("#{date}")
		)

	#$('#datepicker').val 'date'

__Controller.Profile = new ProfileCtrl "section#profile"