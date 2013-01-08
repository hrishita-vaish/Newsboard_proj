class CreateTabpositions < ActiveRecord::Migration
  def change
    create_table :tabpositions do |t|
      t.string :tabname
      t.integer :position

      t.timestamps
    end
  end
end
