class CreateBookImages < ActiveRecord::Migration[6.1]
  def change
    create_table :book_images do |t|
      t.string :image
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
