class ProfileCtrl extends Monocle.Controller
	elements:
		"#txtCompletename"    	  : "nombre"
		"#datepicker"    		  : "fecha"
		"#txtEmail"    			  : "correo"
		"#txtcomentario"    	  : "comentario"
		"#txtnivel"    			  : "nivel"
	events: 
		"tap input#datepicker"  : "onDatePicker"
		"tap button"			: "onSave"

	onDatePicker: ->
		datePicker.show( {date: new Date(), mode: 'date'}, (date) ->
			mes = date.getDate()
			dia = date.getMonth()
			año = date.getFullYear()
			$$('#datepicker').val( dia +  "/" + mes + "/" +  año )
		)
	
	onSave: ->
		db = window.openDatabase("SiJoven", "1.0", "Test DB", 1000000)
		db.transaction( __Controller.Profile.Query, __Controller.Profile.Error, __Controller.Profile.success )

	Query: (tx) ->
		tx.executeSql('INSERT INTO profile (id PRIMARY KEY, nombre, fecha, email, comentario, nivel ) VALUES ( 1, ' + 
			$$("#txtCompletename").val() + '","' +
			$$("#datepicker").val() + '","' +
			$$("#txtEmail").val() + '","' +
			$$("#txtcomentario").val() + '","' +
			$$("#txtnivel").val() + '"")');
		tx.executeSql('UPDATE profile SET nombre = "' + $$("#txtCompletename").val() + '",' +
			' fecha = "' + $$("#datepicker").val() + '",' +
			' email = "' + $$("#txtEmail").val() + '",' +
			' comentario = "' + $$("#txtcomentario").val() + '",' +
			' nivel = "' + $$("#txtnivel").val() + '")');

__Controller.Profile = new ProfileCtrl "section#profile"