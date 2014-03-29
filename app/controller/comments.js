// Generated by CoffeeScript 1.7.1
(function() {
  var CommentsCtrl,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  CommentsCtrl = (function(_super) {
    var establishment_id, parseResponse;

    __extends(CommentsCtrl, _super);

    function CommentsCtrl() {
      return CommentsCtrl.__super__.constructor.apply(this, arguments);
    }

    CommentsCtrl.prototype.events = {
      "tap a[data-action=back]": "back",
      "tap a[data-action=saveComment]": "saveComment"
    };

    establishment_id = null;

    CommentsCtrl.prototype.initialize = function(establishment, data) {
      var aja, establecimiento, result, view;
      establishment_id = establishment.establecimiento[0].id;
      establecimiento = establishment.establecimiento;
      result = data.result;
      aja = {
        establecimiento: establecimiento,
        result: result
      };
      $$('section#comments').html('');
      view = new __View.Comments({
        model: aja
      });
      view.append(aja);
      return Lungo.Router.section('comments');
    };

    CommentsCtrl.prototype.saveComment = function() {
      var comment, url;
      comment = $$('#txtComment').val();
      if (comment) {
        url = "http://app-back.eu1.frbit.net/api/establishment/comment";
        return Lungo.Service.get(url, {
          text: comment,
          establishment_id: establishment_id,
          token: localStorage.getItem('token')
        }, parseResponse, "json");
      } else {
        return Lungo.Notification.error("Llene el campo", ":'(", "warning-sign", 2);
      }
    };

    parseResponse = function(data) {};

    CommentsCtrl.prototype.back = function(e) {
      var id;
      id = e.currentTarget.id;
      return __Controller.Establishment.initialize(id);
    };

    return CommentsCtrl;

  })(Monocle.Controller);

  __Controller.Comments = new CommentsCtrl("section#comments");

}).call(this);