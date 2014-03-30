class MainCtrl extends Monocle.Controller
	elements:
		"#txtSearch"    		  : "search"
	events: 
		"tap li.selectable"       : "onOfert"
		"tap span#btnSearch"      : "OnSearch"
	
	result = null
	initialize: ->
		Lungo.Notification.show()

		db = window.openDatabase("SiJoven", "1.0", "Test DB", 1000000);
		db.transaction( __Controller.Main.Query, __Controller.Main.Error, __Controller.Main.success )

		url = "http://rumbon.gopagoda.com/api/oferts"
		Lungo.Service.get(url, "", parseResponseComments, "json")

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

	OnSearch: ->
		console.log @search.val()

	Error: (err) ->
		alert("Error processing SQL: " + err.code)

	success: ->
		console.log 'success!'

	Query: (tx) ->
		tx.executeSql('CREATE TABLE IF NOT EXISTS favoritos (id unique, data)');
		tx.executeSql('CREATE TABLE IF NOT EXISTS profile (id PRIMARY KEY, nombre, fecha, email, comentario, nivel )');

Lungo.ready ->
	__Controller.Main = new MainCtrl "section#main"
	do __Controller.Main.initialize