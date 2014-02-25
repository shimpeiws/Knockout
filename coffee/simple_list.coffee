$ ->
  ko.applyBindings(new SimpleListModel(["Alpha", "Beta", "Gamma"]))

SimpleListModel = (items) ->
  this.items = ko.observableArray(items)
  this.itemToAdd = ko.observable("")

  this.addItem = =>
    if this.itemToAdd() isnt ""
      this.items.push(this.itemToAdd())
      this.itemToAdd("")
  this
