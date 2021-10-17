class Todo < ActiveRecord::Base
  # def to_pleasant_string
  #  is_completed = completed ? "[ X ]" : "[ ]"
  #  "#{id}.  #{due_date.to_s(:short)} #{todo_text} #{is_completed}"
  # end

  def due_today?
    due_date == Date.due_today
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

  def self.show_list
    puts "My Todo-list\n\n"
    puts "Overdue\n"
    puts overdue.show_list
    puts "\n\n"

    puts "Due_Today\n"
    puts due_today.show_list
    puts "\n\n"

    puts "Due Later\n"
    puts due_later.show_list
    puts "\n\n"
  end

  def self.mark_as_complete!(id)
    todo = find(id)
    todo.completed = true
    todo.save!
    todo
  end
end
