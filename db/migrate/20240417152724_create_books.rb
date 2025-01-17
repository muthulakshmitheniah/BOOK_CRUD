class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.decimal :price
      t.date :published_date

      t.timestamps
    end
  end
end

class ChangePublishedDateTypeInBooks < ActiveRecord::Migration[7.1]
  def change
    change_column :books, :published_date, :date
  end
end
