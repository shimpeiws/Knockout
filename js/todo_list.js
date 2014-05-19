(function() {
  var TodoModel;

  $(function() {
    var setup_items;
    setup_items = [
      {
        name: 'Learn JavaScript'
      }, {
        name: 'Learn vue.js'
      }
    ];
    return ko.applyBindings(new TodoModel(setup_items));
  });

  TodoModel = function(items) {
    var _this = this;
    _this = this;
    _this.page_title = 'todos';
    _this.items = ko.observableArray(items);
    this;
    this.classChange = function() {
      return console.log("classChange");
    };
    return this;
  };

}).call(this);
