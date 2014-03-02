(function() {
  var BetterListModel;

  $(function() {
    return ko.applyBindings(new BetterListModel);
  });

  BetterListModel = function() {
    this.itemToAdd = ko.observable("");
    this.allItems = ko.observableArray(["Fries", "Eggs Benedict", "Ham", "Cheese"]);
    this.selectedItems = ko.observableArray(["Ham"]);
    this.addItem = function() {
      var isItemToAddBlank, isItemToAddNegative;
      isItemToAddBlank = this.itemToAdd !== "";
      isItemToAddNegative = this.allItems.indexOf(this.itemToAdd) < 0;
      if (isItemToAddBlank && isItemToAddNegative) {
        this.allItems.push(this.itemToAdd);
      }
      this.itemToAdd = "";
    };
    this.removeSelected = function() {
      this.allItems.removeAll(this.selectedItems());
      this.selectedItems([]);
    };
    this.sortItems = function() {
      this.allItems.sort();
    };
  };

}).call(this);
