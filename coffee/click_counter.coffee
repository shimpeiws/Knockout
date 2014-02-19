$ ->
  ko.applyBindings(new ClickCounterViewModel())

ClickCounterViewModel = ->
  this.numberOfClicks = ko.observable(0)

  this.registerClick = ->
    this.numberOfClicks(this.numberOfClicks() + 1)
    return

  this.resetClicks = ->
    this.numberOfClicks(0)
    return

  this.hasClickedTooManyTimes = ko.computed (-> this.numberOfClicks() >= 3)
  ,this

  return
