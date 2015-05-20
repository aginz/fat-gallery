class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
