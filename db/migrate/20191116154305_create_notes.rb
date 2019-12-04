class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.text :plan_memo
      t.text :evidence_memo
      t.text :method_memo
      t.text :health_check_memo
      t.integer :health_check_status
      t.references :user, null: false, foreign_key: true
      t.references :objective, null: false, foreign_key: true

      t.timestamps
    end
  end
end
