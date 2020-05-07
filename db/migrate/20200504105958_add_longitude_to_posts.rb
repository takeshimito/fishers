class AddLongitudeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :longitude, :integer
  end
end
