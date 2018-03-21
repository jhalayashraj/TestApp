class AddLikedToLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :liked, :boolean
  end
end
