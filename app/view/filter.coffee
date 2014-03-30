class __View.Filter extends Monocle.View

	container: "section#filters"

	template: """
		<header>
			<h1 class="title centered">Si Joven</h1>
		</header>
		<article id="art_main_map" class="list indented scroll active">
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
				<a href="#" id="onSearch" data-action="search" data-icon="search">
					<span class="icon search"></span></a>
				<a href="#" id="star" class="active" data-action="star" data-icon="star"><span class="icon star"></span></a></a>
				<a href="#" data-view-section="favorites" id="footerFavorite" data-icon="heart"><span class="icon heart"></span></a></a>
				<a href="#" data-view-section="profile" data-action="hv"><span class="icon user"></span></a>
			</nav>
		</footer>
		"""