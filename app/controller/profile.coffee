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
		console.log 'INSERT INTO profile (id PRIMARY KEY, nombre, fecha, email, comentario, nivel ) VALUES ( 1, ' + 
			'"' + @nombre.val() + '",' +
			'"' + @fecha.val() + '",' +
			'"' + @correo.val() + '",' +
			'"' + @comentario.val() + '",' +
			@nivel.val() + ')'
		#tx.executeSql('INSERT INTO profile (id PRIMARY KEY, nombre, fecha, email, comentario, nivel ) VALUES ( 1, ' + 
		#	'"' + @nombre.val() + '",' +
		#	'"' + @fecha.val() + '",' +
		#	'"' + @correo.val() + '",' +
		#	'"' + @comentario.val() + '",' +
		#	@nivel.val() + ')');
		#tx.executeSql('UPDATE profile SET nombre = "' + @nombre.val() + '",' +
		#	' fecha = "' + @fecha.val() + '",' +
		#	' email = "' + @correo.val() + '",' +
		#	' comentario = "' + @comentario.val() + '",' +
		#	' nivel = "' + @nivel.val() + ')');

__Controller.Profile = new ProfileCtrl "section#profile"