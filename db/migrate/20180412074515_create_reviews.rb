class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :comment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
