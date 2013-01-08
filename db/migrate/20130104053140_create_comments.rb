class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :news_discussion

      t.timestamps
    end
    add_index :comments, :news_discussion_id
  end
end
