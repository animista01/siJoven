class __View.Ofert extends Monocle.View

	container: "section#ofert"
	template: """
		<header>
			<nav class="left">
				<a href="#" id="back"><span class="icon chevron-left"></span></a>
			</nav>
			<p class="title centered">{{#result}} {{EntidadNombre}} {{/result}}</p>
   		</header>
	    <article id="art-ofert" class="list scroll indented active">
	    	{{#result}}
		    	<div class="empty" id="{{PkOferta}}">
		    		<nav class="on-right" id="addFavorite">
						<span class="icon heart"></span>
					</nav>
					<span class="tag count on-left">{{EdadObejtivo}}</span>
					<span class="icon paper-clip"></span>
		            <small>{{Oportunidad}}</small>
		            <small>Ubicacion: {{Ubicacion}}</small>
		            <small>{{UrlFuente}}</small>
	        	</div>
	        {{/result}}
	    </article>
		"""