class SetPostPointsValueDefault < ActiveRecord::Migration
  def change
  	change_column_default :posts, :points, 1
  end
end
