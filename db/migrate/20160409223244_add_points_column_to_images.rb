class AddPointsColumnToImages < ActiveRecord::Migration
  def change
    add_column :images, :points, :integer
  end
end
