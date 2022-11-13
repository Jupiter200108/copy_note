class CreateMemos < ActiveRecord::Migration[6.1]
  def change
    create_table :memos do |t|
      t.integer :user_id
      t.integer :folder_id
      t.string :title
      t.text :comment
      t.text :copy_text

      t.timestamps
    end
  end
end
