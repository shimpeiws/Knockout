$ ->
  ko.applyBindings(new ViewModel("Planet", "Earth"))

ViewModel = (first, last) ->
  this.firstName = ko.observable(first)
  this.lastName = ko.observable(last)
  this.fullName = ko.computed ( -> this.firstName() + " " + this.lastName())
    ,this
  return