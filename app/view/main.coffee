class __View.Main extends Monocle.View

	container: "section#main"

	template: """
		<header>
			<h1 class="title centered">Si Joven</h1>
		</header>
		<article id="art_main_map" class="list indented scroll active">
	    	<div class="form">
				<fieldset>
					<span id="btnSearch" class="icon search"></span>
	                <input type="text" id="txtSearch" placeholder="Buscar...">
	            </fieldset>
			</div>
			<ul>
				{{#result}}
					<li class="selectable" id="{{PkOferta}}">
						<span class="tag count on-right">{{EdadObejtivo}}</span>
			            <strong>{{EntidadNombre}}</strong>
						<small>{{Oportunidad}}</small>
						<small>{{FechaVencimiento}}</small>
			        </li>
				{{/result}}
			</ul>
		</article>
		<footer>
			<nav>
				<a href="#" class="active" data-action="search" data-icon="search"></a>
				<a href="#" data-action="star" data-icon="star"></a>
				<a href="#" data-action="heart" data-icon="heart"></a>
				<a href="#" data-view-section="profile" data-action="hv"><span>HV</span></a>
			</nav>
		</footer>
		"""