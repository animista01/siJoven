// Generated by CoffeeScript 1.6.3
var FavoritesCtrl, _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

FavoritesCtrl = (function(_super) {
  __extends(FavoritesCtrl, _super);

  function FavoritesCtrl() {
    _ref = FavoritesCtrl.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  FavoritesCtrl.prototype.events = {
    "tap article#art-favorites ul li": "onTapStablishment"
  };

  FavoritesCtrl.prototype.initialize = function() {
    var db;
    db = window.openDatabase("SiJoven", "1.0", "Test DB", 1000000);
    return db.transaction(__Controller.Favorites.Query, __Controller.Favorites.Error);
  };

  FavoritesCtrl.prototype.QuerySuccess = function(tx, results) {
    return console.log(results);
  };

  FavoritesCtrl.prototype.Error = function(err) {
    return console.log(err);
  };

  FavoritesCtrl.prototype.Query = function(tx) {
    return tx.executeSql('SELECT * FROM favorites', [], __Controller.Favorites.QuerySuccess, __Controller.Favorites.Error);
  };

  FavoritesCtrl.prototype.onTapStablishment = function(e) {
    var id;
    Lungo.Notification.show();
    id = e.currentTarget.id;
    return __Controller.Establishment.initialize(id);
  };

  return FavoritesCtrl;

})(Monocle.Controller);

__Controller.Favorites = new FavoritesCtrl("section#favorites");
