class ProfileCtrl extends Monocle.Controller

	events: 
		"tap input#datepicker"  : "onDatePicker"

	onDatePicker: ->
		datePicker.show( {date: new Date(), mode: 'date'}, (date) ->
			mes = date.getDate()
			dia = date.getMonth()
			año = date.getFullYear()
			$$('#datepicker').val( dia +  "/" + mes + "/" +  año )
		)
		
__Controller.Profile = new ProfileCtrl "section#profile"