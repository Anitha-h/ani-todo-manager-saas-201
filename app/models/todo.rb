class Todo < ActiveRecord::Base
  belongs_to :user
  #table called users
  #todos table will contain"user_id"
  def due_today?
    due_date == Date.due_today
  end

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def self.overdue
    where("due_date < ? and (not completed)", Date.today)
  end
  def self.due_today
    where("due_date = ?", Date.today)
  end
  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed
    where(completed: true)
  end

  def self.mark_as_complete!(id)
    todo = find(id)
    todo.completed = true
    todo.save!
    todo
  end
end
