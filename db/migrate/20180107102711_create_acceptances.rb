class CreateAcceptances < ActiveRecord::Migration[5.1]
  def change
    create_table :acceptances do |t|
      t.text :email, index: true
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end
