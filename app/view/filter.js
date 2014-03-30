// Generated by CoffeeScript 1.6.3
var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

__View.Filter = (function(_super) {
  __extends(Filter, _super);

  function Filter() {
    _ref = Filter.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Filter.prototype.container = "section#filters";

  Filter.prototype.template = "<header>\n	<h1 class=\"title centered\">Si Joven</h1>\n</header>\n<article id=\"art_main_map\" class=\"list indented scroll active\">\n	<ul>\n		{{#result}}\n			<li class=\"selectable\" id=\"{{PkOferta}}\">\n				<span class=\"tag count on-right\">{{EdadObejtivo}}</span>\n	            <strong>{{EntidadNombre}}</strong>\n				<small>{{Oportunidad}}</small>\n				<small>{{FechaVencimiento}}</small>\n	        </li>\n		{{/result}}\n	</ul>\n</article>\n<footer>\n	<nav>\n		<a href=\"#\" id=\"onSearch\" data-action=\"search\" data-icon=\"search\">\n			<span class=\"icon search\"></span></a>\n		<a href=\"#\" id=\"star\" class=\"active\" data-action=\"star\" data-icon=\"star\"><span class=\"icon star\"></span></a></a>\n		<a href=\"#\" id=\"footerFavorite\" data-icon=\"heart\"><span class=\"icon heart\"></span></a></a>\n		<a href=\"#\" data-view-section=\"profile\" data-action=\"hv\"><span class=\"icon user\"></span></a>\n	</nav>\n</footer>";

  return Filter;

})(Monocle.View);
