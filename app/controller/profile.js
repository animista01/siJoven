// Generated by CoffeeScript 1.7.1
(function() {
  var ProfileCtrl,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  ProfileCtrl = (function(_super) {
    __extends(ProfileCtrl, _super);

    function ProfileCtrl() {
      return ProfileCtrl.__super__.constructor.apply(this, arguments);
    }

    ProfileCtrl.prototype.events = {
      "tap input#datepicker": "onDatePicker"
    };

    ProfileCtrl.prototype.onDatePicker = function() {
      var option;
      option = {
        date: new Date(),
        mode: 'date'
      };
      return datePicker.show(option, function(date) {
        return $$('#datepicker').val('date');
      });
    };

    return ProfileCtrl;

  })(Monocle.Controller);

  __Controller.Profile = new ProfileCtrl("section#profile");

}).call(this);
