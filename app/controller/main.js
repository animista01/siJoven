// Generated by CoffeeScript 1.6.3
var MainCtrl, _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

MainCtrl = (function(_super) {
  var parseResponseComments, result;

  __extends(MainCtrl, _super);

  function MainCtrl() {
    _ref = MainCtrl.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  MainCtrl.prototype.elements = {
    "#txtSearch": "search"
  };

  MainCtrl.prototype.events = {
    "tap li.selectable": "onOfert",
    "tap span#btnSearch": "OnSearch",
    "tap a#footerFavorite": "OnFavorite",
    "tap a#star": "OnStar"
  };

  result = null;

  MainCtrl.prototype.initialize = function() {
    var db, now, url, _60_seconds_from_now;
    Lungo.Notification.show();
    db = window.openDatabase("SiJoven", "1.0", "Test DB", 1000000);
    db.transaction(__Controller.Main.Query, __Controller.Main.Error, __Controller.Main.success);
    url = "http://rumbon.gopagoda.com/api/oferts";
    Lungo.Service.get(url, "", parseResponseComments, "json");
    now = new Date().getTime();
    _60_seconds_from_now = new Date(now + 3 * 60 * 1000);
    return window.plugin.notification.local.add({
      id: 1,
      title: 'Recuerda',
      message: 'La oferta del sena esta llegando a su fin',
      repeat: 'weekly',
      date: _60_seconds_from_now
    });
  };

  parseResponseComments = function(data) {
    var view;
    result = {
      result: data
    };
    $$('section#main').html('');
    view = new __View.Main({
      model: result
    });
    view.append(result);
    Lungo.Router.section('main');
    return Lungo.Notification.hide();
  };

  MainCtrl.prototype.onOfert = function(e) {
    var id, myMap, row, _i, _len, _ref1;
    myMap = {};
    _ref1 = result.result;
    for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
      row = _ref1[_i];
      myMap[row.PkOferta] = {
        result: [
          {
            PkOferta: row.PkOferta,
            EntidadNombre: row.EntidadNombre,
            EdadObejtivo: row.EdadObejtivo,
            Oportunidad: row.Oportunidad,
            Ubicacion: row.Ubicacion,
            UrlFuente: row.UrlFuente
          }
        ]
      };
    }
    id = e.currentTarget.id;
    Lungo.Notification.show();
    return __Controller.Ofert.initialize(myMap[id]);
  };

  MainCtrl.prototype.OnFavorite = function() {
    return __Controller.Favorites.initialize();
  };

  MainCtrl.prototype.OnStar = function() {
    return __Controller.Filter.initialize();
  };

  MainCtrl.prototype.OnSearch = function() {
    var f, i, myMap, row, view, _i, _len, _ref1;
    Lungo.Notification.show();
    myMap = [];
    i = 0;
    _ref1 = result.result;
    for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
      row = _ref1[_i];
      f = row.EntidadNombre.toUpperCase().indexOf($$("#txtSearch").val().toUpperCase());
      if (f >= 0) {
        myMap[i] = {
          PkOferta: row.PkOferta,
          EntidadNombre: row.EntidadNombre,
          EdadObejtivo: row.EdadObejtivo,
          Oportunidad: row.Oportunidad,
          Ubicacion: row.Ubicacion,
          UrlFuente: row.UrlFuente
        };
        i = i + 1;
      }
    }
    $$('#main').html('');
    result = {
      result: myMap
    };
    console.log(result);
    view = new __View.Main({
      model: result
    });
    view.append(result);
    return Lungo.Notification.hide();
  };

  MainCtrl.prototype.Error = function(err) {
    return alert("Error processing SQL: " + err.code);
  };

  MainCtrl.prototype.success = function() {
    return console.log('success!');
  };

  MainCtrl.prototype.Query = function(tx) {
    tx.executeSql('CREATE TABLE IF NOT EXISTS favorites (PkOferta unique, EntidadNombre, EdadObejtivo, Oportunidad, Ubicacion, UrlFuente)');
    tx.executeSql('CREATE TABLE IF NOT EXISTS profile (id PRIMARY KEY, nombre, fecha, email, comentario, nivel )');
    return tx.executeSql('CREATE TABLE IF NOT EXISTS preferences (id PRIMARY KEY, edad, ubicacion, entidades, categorias )');
  };

  return MainCtrl;

})(Monocle.Controller);

Lungo.ready(function() {
  __Controller.Main = new MainCtrl("section#main");
  return __Controller.Main.initialize();
});
