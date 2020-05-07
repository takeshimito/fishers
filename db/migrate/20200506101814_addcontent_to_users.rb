class AddcontentToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :content, :string
  end
end
