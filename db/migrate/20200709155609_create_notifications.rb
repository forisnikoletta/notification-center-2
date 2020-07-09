class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :body
      t.string :users_id
      t.datetime :seen

      t.timestamps
    end
  end
end
