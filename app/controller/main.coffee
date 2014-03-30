class MainCtrl extends Monocle.Controller
	elements:
		"#txtSearch"    		  : "search"
	events: 
		"tap li.selectable"       : "onOfert"
		"tap span#btnSearch"      : "OnSearch"
		"tap a#star"              : "OnStar"

	result = null
	initialize: ->
		Lungo.Notification.show()

		db = window.openDatabase("SiJoven", "1.0", "Test DB", 1000000);
		db.transaction( __Controller.Main.Query, __Controller.Main.Error, __Controller.Main.success )

		url = "http://rumbon.gopagoda.com/api/oferts"
		Lungo.Service.get(url, "", parseResponseComments, "json")

		now = new Date().getTime()
		_60_seconds_from_now = new Date(now + 30*1000)

		window.plugin.notification.local.add({
		    id:      10,
		    title:   'Recuerda',
		    message: 'La oferta del sena esta llegando a su fin',
		    repeat:  'weekly',
		    date:    _60_seconds_from_now
		})

	parseResponseComments = (data) ->
		result = {result: data}
		$$('section#main').html('')
		view = new __View.Main model: result
		view.append result
		Lungo.Router.section 'main'
		Lungo.Notification.hide()

	onOfert: (e) ->
		myMap = {}
		for row in result.result
		  myMap[row.PkOferta] = result : [PkOferta: row.PkOferta, EntidadNombre: row.EntidadNombre, EdadObejtivo: row.EdadObejtivo, Oportunidad: row.Oportunidad, Ubicacion:row.Ubicacion, UrlFuente: row.UrlFuente]
		id = e.currentTarget.id

		Lungo.Notification.show()
		__Controller.Ofert.initialize myMap[id]

	OnStar: ->
		do __Controller.Filter.initialize

	OnSearch: ->
		Lungo.Notification.show()
		myMap = []
		i = 0
		for row in result.result
			f = row.EntidadNombre.toUpperCase().indexOf $$("#txtSearch").val().toUpperCase()
			g = row.Oportunidad.toUpperCase().indexOf $$("#txtSearch").val().toUpperCase()
			if  f >=  0 or g >= 0
				myMap[i] = PkOferta: row.PkOferta, EntidadNombre: row.EntidadNombre, EdadObejtivo: row.EdadObejtivo, Oportunidad: row.Oportunidad, Ubicacion:row.Ubicacion, UrlFuente: row.UrlFuente
				i = i + 1
		$$('#main').html('')
		result = result: myMap
		console.log result
		view = new __View.Main model: result
		view.append result
		Lungo.Notification.hide()

	Error: (err) ->
		alert("Error processing SQL: " + err.code)

	success: ->
		console.log 'success!'

	Query: (tx) ->
		tx.executeSql('CREATE TABLE IF NOT EXISTS favorites (PkOferta unique, EntidadNombre, EdadObejtivo, Oportunidad, Ubicacion, UrlFuente)');
		tx.executeSql('CREATE TABLE IF NOT EXISTS profile (id PRIMARY KEY, nombre, fecha, email, comentario, nivel )');
		tx.executeSql('CREATE TABLE IF NOT EXISTS preferences (id PRIMARY KEY, edad, ubicacion, entidades, categorias )');

Lungo.ready ->
	__Controller.Main = new MainCtrl "section#main"
	do __Controller.Main.initialize