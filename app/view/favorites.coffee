class __View.Favorites extends Monocle.View

	container: "section#favorites article#art-favorites ul"

	template: """
		{{#result}}
			<li class="theme" id="{{id}}">
				<span class="tag count on-right">{{telephone}}</span>
	            <strong>{{name}}</strong>
				<small>{{address}}</small>
			</li>
		{{/result}}
		"""