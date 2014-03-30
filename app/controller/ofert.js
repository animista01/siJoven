// Generated by CoffeeScript 1.7.1
(function() {
  var OfertCtrl,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  OfertCtrl = (function(_super) {
    __extends(OfertCtrl, _super);

    function OfertCtrl() {
      return OfertCtrl.__super__.constructor.apply(this, arguments);
    }

    OfertCtrl.prototype.events = {
      "tap a#back": "onBack",
      "tap nav#addFavorite": "onAddFavorite"
    };

    OfertCtrl.prototype.initialize = function(data) {
      var view;
      $$('section#ofert').html('');
      view = new __View.Ofert({
        model: data
      });
      view.append(data);
      Lungo.Router.section('ofert');
      return Lungo.Notification.hide();
    };

    OfertCtrl.prototype.onBack = function() {
      return __Controller.Main.initialize();
    };

    OfertCtrl.prototype.onAddFavorite = function() {
      return console.log('aa');
    };

    return OfertCtrl;

  })(Monocle.Controller);

  __Controller.Ofert = new OfertCtrl("section#ofert");

}).call(this);