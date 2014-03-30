class FilterCtrl extends Monocle.Controller
	events: 
		"tap li.selectable"       : "onOfert"
		"tap a#onSearch"          : "OnSearch"
		"tap a#footerFavorite"    : "OnFavorite"

	initialize: ->
		Lungo.Notification.show()
		url = "http://rumbon.gopagoda.com/api/oferts"
		Lungo.Service.get(url, "", parseFilter, "json")

	parseFilter = (data) ->
		result = {result: data}
		$$('section#filters').html('')
		view = new __View.Filter model: result
		view.append result
		Lungo.Router.section 'filters'
		Lungo.Notification.hide()

	OnSearch: ->
		do __Controller.Main.initialize

	onOfert: (e) ->
		myMap = {}
		for row in result.result
		  myMap[row.PkOferta] = result : [PkOferta: row.PkOferta, EntidadNombre: row.EntidadNombre, EdadObejtivo: row.EdadObejtivo, Oportunidad: row.Oportunidad, Ubicacion:row.Ubicacion, UrlFuente: row.UrlFuente]
		id = e.currentTarget.id

		Lungo.Notification.show()
		__Controller.Ofert.initialize myMap[id]

	OnFavorite: ->
		do __Controller.Favorites.initialize

__Controller.Filter = new FilterCtrl "section#filters"