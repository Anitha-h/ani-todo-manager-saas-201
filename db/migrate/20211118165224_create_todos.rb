class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.text :todo_text
      t.date :due_date
      t.boolean :completed
      t.datetime :created_at
      t.datetime :updated_at
      t.bigint :user_id

      t.timestamps
    end
  end
end
