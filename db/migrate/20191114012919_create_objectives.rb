class CreateObjectives < ActiveRecord::Migration[6.0]
  def change
    create_table :objectives do |t|
      t.string :title
      t.text :details
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
