class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.date :date_of_birth
      t.boolean :gender
      t.text :about_me
      t.text :hobbies

      t.timestamps
    end
  end
end
