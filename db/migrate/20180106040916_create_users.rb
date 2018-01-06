class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :name
      t.references :authentication, foreign_key: true

      t.timestamps
    end
  end
end
