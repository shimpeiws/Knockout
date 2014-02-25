(function() {
  var SimpleListModel;

  $(function() {
    return ko.applyBindings(new SimpleListModel(["Alpha", "Beta", "Gamma"]));
  });

  SimpleListModel = function(items) {
    var _this = this;
    this.items = ko.observableArray(items);
    this.itemToAdd = ko.observable("");
    this.addItem = function() {
      if (_this.itemToAdd() !== "") {
        _this.items.push(_this.itemToAdd());
        return _this.itemToAdd("");
      }
    };
    return this;
  };

}).call(this);
