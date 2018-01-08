class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :uuid, index: {unique: true}
      t.text :body
      t.text :emails
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
