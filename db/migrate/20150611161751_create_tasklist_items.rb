class CreateTasklistItems < ActiveRecord::Migration
  def change
    create_table :tasklist_items do |t|
      t.references :tasklist, index: true
      t.string :content

      t.timestamps null: false
    end
    add_foreign_key :tasklist_items, :tasklists
  end
end
