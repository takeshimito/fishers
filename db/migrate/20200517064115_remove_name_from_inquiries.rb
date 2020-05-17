class RemoveNameFromInquiries < ActiveRecord::Migration[5.2]
  def change
    remove_column :inquiries, :name, :string
  end
end
