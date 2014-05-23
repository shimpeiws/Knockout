$ ->
  # ToDo一件あたりのオブジェクト
  Todo = (title, done, order, callback)->
    self = this
    self.title = ko.observable(title)
    self.done = ko.observable(done)
    self.order = order
    self.updateCallback = ko.computed  -> 
        callback(self)
        true
      return
    
    
  # ViewModel
  viewModel = ->
    self = this
    self.page_title = 'TODOS by Knockout.js'
    self.todos = ko.observableArray([])
    self.inputTitle = ko.observable("")
    self.doneTodos = ko.observable(0)
    self.markAll = ko.observable(false)
    
    self.addOne = ->
      order = self.todos.length
      newTodo = new Todo(self.inputTitle(), false, order, self.countUpdate)
      self.todos.push(newTodo)
      return
      
    self.createOnEnter = (item, event) ->
      if event.keyCode == 13 && self.inputTitle()
        # 新規のTodoオブジェクト作成 & Observerbleに入る
        self.addOne()
        #  Todo入力テキストボックスの初期化
        self.inputTitle("")
      else
        return true
      return
      
    # 編集中かどうかの(Enter押下時のため)
    self.toggleEditMode = (item, event) ->
      $(event.target).closest('li').toggleClass('editing')
    
    self.editOnEnter = (item, event) ->
      if event.keyCode == 13 && item.title
        item.updateCallback()
        self.toggleEditMode(item, event)
      else
        return true
      return
      
    self.markAll.subscribe((newValue) ->
        ko.utils.arrayForEach(self.todos(), (it) ->
            item.done(newValue)
            return
        )
        return
      )
    
    self.countUpdate = (item) ->
      doneArray = ko.utils.arrayFilter(self.todos(), (it) ->
          it.done()
        )
        self.doneTodos(doneArray.length)
        return true
      return
    
    self.countDoneText = (bool) ->
      cntAll = self.todos().length
      cnt = if bool then self.doneTodos() else cntAll - self.doneTodos()
      text = "<span class='count'>" + cnt.toString() + "</span>"
      text += if bool then " completed" else " remaining"
      text += if self.doneTodos() > 1 then " items" else " item"
      text
      
    self.clear = ->
      self.todos.remove (item) ->
          item.done()
      return
    return

  ko.applyBindings(new viewModel())

  return
