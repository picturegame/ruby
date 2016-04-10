class AddSolvedToPosts < ActiveRecord::Migration
  def change
  	add_column(:posts, :solved, :boolean, :default => false)
  end
end
