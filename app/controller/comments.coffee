class CommentsCtrl extends Monocle.Controller

	events:
		"tap a[data-action=back]"            : "back"
		"tap a[data-action=saveComment]"     : "saveComment"

	establishment_id = null
	initialize: (establishment, data) ->
		establishment_id = establishment.establecimiento[0].id

		establecimiento = establishment.establecimiento
		result = data.result
		aja = {establecimiento, result}

		$$('section#comments').html('')
		view = new __View.Comments model: aja
		view.append aja
		
		Lungo.Router.section 'comments'

	saveComment: ->
		comment = $$('#txtComment').val()
		if comment
			url = "http://app-back.eu1.frbit.net/api/establishment/comment"
			Lungo.Service.get(url, { text: comment, establishment_id: establishment_id, token: localStorage.getItem('token') }, parseResponse, "json")
		else
			Lungo.Notification.error "Llene el campo",
				":'(",
				"warning-sign",
				2
	
	parseResponse = (data) ->

	back: (e) ->
		id = e.currentTarget.id
		__Controller.Establishment.initialize id
		
__Controller.Comments = new CommentsCtrl "section#comments"