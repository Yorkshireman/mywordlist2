class CreateWordlists < ActiveRecord::Migration
  def change
    create_table :wordlists do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
