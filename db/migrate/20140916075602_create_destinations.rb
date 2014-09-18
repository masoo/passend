class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.text :email
      t.references :message, index: true
      t.references :user, index: true
      t.boolean :is_checked

      t.timestamps
    end
  end
end
