class MainCtrl extends Monocle.Controller
	elements:
		"#txtSearch"    			  : "search"
	events: 
		"tap a[data-action=locate]"   : "onLocate"
		"tap span#btnSearch"          : "OnSearch"

	initialize: ->
		Lungo.Router.section 'main'
		db = window.openDatabase("SiJoven", "1.0", "Test DB", 1000000);
		db.transaction( __Controller.Main.Query, (err) ->
    			alert("Error processing SQL: "+err.code)
			, -> alert("success!") )

	OnSearch: ->
		console.log @search.val()

	Query: (tx) ->
		tx.executeSql('CREATE TABLE IF NOT EXISTS favoritos (id unique, data)');
		tx.executeSql('CREATE TABLE IF NOT EXISTS profile (id PRIMARY KEY, nombre, fecha, email, comentario, nivel )');

Lungo.ready ->
	__Controller.Main = new MainCtrl "section#main"
	do __Controller.Main.initialize