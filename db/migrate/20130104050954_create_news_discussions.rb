class CreateNewsDiscussions < ActiveRecord::Migration
  def change
    create_table :news_discussions do |t|
      t.string :headline
      t.text :content
      t.string :name

      t.timestamps
    end
  end
end
