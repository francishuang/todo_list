module TodosHelper

  def todo_show_button(todo)
    link_to 'Show', todo_path(todo), class: 'btn btn-info'
  end

  def todo_delete_button(todo)
    return unless todo.done?
    link_to 'Delete', todo_path(todo), class: 'btn btn-danger', method: :delete, data: { confirm: 'Delete this item ?' }
  end

  def todo_edit_button(todo)
    link_to 'Edit', edit_todo_path(todo), class: 'btn btn-primary'
  end

end
