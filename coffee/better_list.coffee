$ ->
  ko.applyBindings(new BetterListModel)

BetterListModel = ->
  this.itemToAdd = ko.observable("")
  # Initial items
  this.allItems = ko.observableArray(["Fries", "Eggs Benedict", "Ham", "Cheese"])
  this.selectedItems = ko.observableArray(["Ham"])

  this.addItem = ->
    isItemToAddBlank = this.itemToAdd isnt "" 
    # isItemToAddNegative = true
    isItemToAddNegative = this.allItems.indexOf(this.itemToAdd) < 0
    if isItemToAddBlank and isItemToAddNegative
      this.allItems.push(this.itemToAdd)
    this.itemToAdd = ""
    return

  this.removeSelected = ->
    this.allItems.removeAll(this.selectedItems())
    this.selectedItems([])
    return

  this.sortItems = ->
    this.allItems.sort()
    return

  return
