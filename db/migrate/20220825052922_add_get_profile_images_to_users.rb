class AddGetProfileImagesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :get_get_profile_image, :integer
  end
end
