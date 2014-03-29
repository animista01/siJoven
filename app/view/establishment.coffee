class __View.Establishment extends Monocle.View

	container: "section#establishment article#art-establishment"

	template: """
		{{#result}}
			<div class="empty" id="{{id}}">
				<span class="icon map-marker"></span>
				<strong>{{name}}</strong>
	            <small>{{description}}</small>
	            <small>{{address}}</small>
	            <small>{{telephone}}</small>
        	</div>
		{{/result}}
		"""