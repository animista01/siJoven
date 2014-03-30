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
			<nav style="text-align: center;">
    			<a id="edad" class="button large margin-left"><span>Edad</span></a>
    			<a id="ubicacion" class="button large margin-left"><span class="icon map-marker"></span></a>
    			<a id="entidad" class="button large margin-left"><span class="icon briefcase"></span></a>
    			<a id="categoria" class="button large margin-left"><span class="icon list-ol"></span></a>
			</nav>
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
				<a href="#" class="active" data-action="search" data-icon="search">
					<span class="icon search"></span></a>
				<a href="#" data-action="star" data-icon="star"><span class="icon star"></span></a></a>
				<a href="#" data-action="heart" data-icon="heart"><span class="icon heart"></span></a></a>
				<a href="#" data-view-section="profile" data-action="hv"><span class="icon user"></span></a>
			</nav>
		</footer>
		"""