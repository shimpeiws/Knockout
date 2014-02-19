(function() {
  var ViewModel;

  $(function() {
    return ko.applyBindings(new ViewModel("Planet", "Earth"));
  });

  ViewModel = function(first, last) {
    this.firstName = ko.observable(first);
    this.lastName = ko.observable(last);
    this.fullName = ko.computed((function() {
      return this.firstName() + " " + this.lastName();
    }), this);
  };

}).call(this);
