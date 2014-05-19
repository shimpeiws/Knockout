$ ->
  setup_items = [
    {name: 'Learn JavaScript'}
    {name: 'Learn vue.js'}
  ]
  ko.applyBindings(new TodoModel(setup_items))
  
TodoModel = (items)->
  _this = this
  _this.page_title = 'todos'
  _this.items = ko.observableArray(items)
  this
  
  this.classChange = =>
    console.log("classChange")
  this
    