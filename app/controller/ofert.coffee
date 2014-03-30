class OfertCtrl extends Monocle.Controller

	events: 
		"tap a#back"       		: "onBack"
		"tap a#addFavorite"     : "onAddFavorite"
		"tap a#facebook"        : "onFacebook"


	oferta = null
	initialize: (data) ->
		oferta = data
		$$('section#ofert').html('')
		view = new __View.Ofert model: data
		view.append data
		Lungo.Router.section 'ofert'
		Lungo.Notification.hide()

	onBack: ->
		do __Controller.Main.initialize

	onAddFavorite: ->
		db = window.openDatabase("SiJoven", "1.0", "Test DB", 1000000)
		db.transaction( __Controller.Ofert.Query, __Controller.Ofert.Error, __Controller.Ofert.success )

	Query: (tx) ->
		tx.executeSql('INSERT INTO favorites (PkOferta unique, EntidadNombre, EdadObejtivo, Oportunidad, Ubicacion, UrlFuente ) VALUES ("' + oferta.result[0].PkOferta + '","' + oferta.result[0].EntidadNombre + '","' + oferta.result[0].EdadObejtivo + '","' + oferta.result[0].Oportunidad + '","' + oferta.result[0].Ubicacion + '","' + oferta.result[0].UrlFuente + '")')

	onFacebook: ->
		window.plugins.socialsharing.share( oferta.result[0].Oportunidad, 'Te Invito a que le heches un vistazo', null, oferta.result[0].UrlFuente)

__Controller.Ofert = new OfertCtrl "section#ofert"