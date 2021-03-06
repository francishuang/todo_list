class Todo < ApplicationRecord
  validates_presence_of :name, :due_date, :note

  def done?
    !overdue?
  end

  private

  def overdue?
    due_date < Date.today
  end
end
