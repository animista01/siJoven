class __View.Ofert extends Monocle.View

	container: "section#ofert"
	template: """
		<header>
			<nav class="left">
				<a href="#" id="back"><span class="icon chevron-left"></span></a>
			</nav>
			<p class="title centered">{{#result}} {{EntidadNombre}} {{/result}}</p>
   		</header>
	    <article id="art-ofert" class="active">
	    	{{#result}}
		    	<div class="empty" id="{{PkOferta}}">
		    		<nav class="on-right">
		    			<a id="addFavorite" class="button"><span class="icon ok-circle"></span></a>
		    			<a id="facebook" class="button"><span class="icon share-alt"></span></a>
		    			<a id="sendhv" class="button"><span class="icon envelope"></span></a>
					</nav>
					<span class="tag count on-left">{{EdadObejtivo}} - {{FechaVencimiento}}</span>
					<br><br><br>
					<span class="icon paper-clip"></span>
					<br>
		            <small>{{Oportunidad}}</small>
		            <small>Ubicacion: {{Ubicacion}}</small>
		            <small>{{UrlFuente}}</small>
	        	</div>
	        {{/result}}
	    </article>
	    <footer>
			<nav>
				<a href="#" data-action="search" data-view-section="main"  data-icon="search">
					<span class="icon search"></span></a>
				<a href="#" data-action="star" data-icon="star"><span class="icon star"></span></a></a>
				<a href="#" data-view-section="favorites" data-action="heart" data-icon="heart"><span class="icon heart"></span></a></a>
				<a href="#" data-view-section="profile" data-action="hv"><span class="icon user"></span></a>
			</nav>
		</footer>
		"""